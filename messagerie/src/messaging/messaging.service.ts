import { Injectable } from '@nestjs/common';

@Injectable()
export class MessagingService {
  private users: Map<string, string> = new Map(); // userId -> socketId

  registerUser(userId: string, socketId: string) {
    this.users.set(userId, socketId);
  }

  getSocketId(userId: string): string | undefined {
    return this.users.get(userId);
  }

  removeUser(userId: string) {
    this.users.delete(userId);
  }
}
