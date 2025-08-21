import { Controller, Get } from '@nestjs/common';
import { InstagramService } from './instagram.service';

@Controller('instagram')
export class InstagramController {
  constructor(private readonly InstagramService: InstagramService) {}

  @Get('user')
  getHello(): string {
    return this.InstagramService.getHello();
  }
}
