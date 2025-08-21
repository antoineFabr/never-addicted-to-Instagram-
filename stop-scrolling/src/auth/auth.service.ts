import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from '../lib/prisma.service';
import bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private prisma: PrismaService,
  ) {}

  async register(mail: string): Promise<any> {
    const newCode =
      Math.floor(Math.random() * (999999999 - 100000000 + 1)) + 100000000;
    console.log(newCode);
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(String(newCode), salt);

    const newUser = await this.prisma.users.create({
      data: {
        mail: mail,
        sel: salt,
        clef_login: hash,
      },
    });

    const payload = {
      mail: newUser.mail,
      id: newUser.id,
    };
    const accessToken = this.jwtService.sign(payload, {
      expiresIn: '15m',
      secret: process.env.JWT_ACCESS_SECRET,
    });
    const refreshToken = this.jwtService.sign(payload, {
      expiresIn: '7d',
      secret: process.env.JWT_REFRESH_SECRET,
    });
    return { newUser, newCode, accessToken, refreshToken };
  }

  async login(mail: string, code: Number): Promise<any> {
    const userLogin = await this.prisma.users.findUnique({
      where: {
        mail: mail,
      },
    });
    if (!userLogin || !userLogin.sel) {
      throw new Error("l'utilisateur n'existe pas");
    }

    const hash = await bcrypt.hash(String(code), userLogin.sel);
    if (userLogin.clef_login !== hash) {
      throw new Error('mot de passe incorrect');
    }

    const payload = {
      mail: userLogin.mail,
      id: userLogin.id,
    };
    const accessToken = this.jwtService.sign(payload, {
      secret: process.env.JWT_ACCESS_SECRET,

      expiresIn: '15m',
    });
    const refreshToken = this.jwtService.sign(payload, {
      secret: process.env.JWT_REFRESH_SECRET,

      expiresIn: '7d',
    });
    return { accessToken, refreshToken };
  }

  async refresh(refresh_token: string): Promise<any> {
    try {
      const token = await this.jwtService.verify(refresh_token, {
        secret: process.env.JWT_REFRESH_SECRET,
      });
      if (!token) {
        throw new Error('Token invalide');
      }
      const payload = {
        mail: token.mail,
        id: token.id,
      };
      const newAccessToken = this.jwtService.sign(payload, {
        secret: process.env.JWT_ACCESS_SECRET,
        expiresIn: '15m',
      });

      const newRefreshToken = this.jwtService.sign(payload, {
        expiresIn: '7d',
        secret: process.env.JWT_REFRESH_SECRET,
      });

      return { access_token: newAccessToken, refresh_token: newRefreshToken };
    } catch (e) {
      throw new UnauthorizedException(`Erreur Serveur ${e}`);
    }
  }
}
