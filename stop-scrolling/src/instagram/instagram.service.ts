import { Injectable } from '@nestjs/common';

@Injectable()
export class InstagramService {
  getHello(): string {
    return 'Hello World!';
  }
}
