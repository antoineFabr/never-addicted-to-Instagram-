import { Controller, Post, Body, Get, Headers } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  async register(@Body() body: { mail: string }) {
    return await this.authService.register(body.mail);
  }

  @Post('login')
  async login(@Body() body: { mail: string; code: number }) {
    return await this.authService.login(body.mail, body.code);
  }

  @Post('refresh')
  async refresh(@Body() body: { refresh_token: string }) {
    return await this.authService.refresh(body.refresh_token);
  }
}
