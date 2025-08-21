import { Injectable } from '@nestjs/common';
import { PrismaService } from '../lib/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async getUserById(id: number): Promise<any> {
    const user = await this.prisma.users.findUnique({
      where: {
        id: id,
      },
    });
    return user;
  }
}
