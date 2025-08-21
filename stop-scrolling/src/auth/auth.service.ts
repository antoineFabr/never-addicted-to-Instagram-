import { Injectable } from '@nestjs/common';
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
    return { newUser, newCode };
  }
}
