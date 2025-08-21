import { Module } from '@nestjs/common';
import { InstagramController } from './instagram.controller';
import { InstagramService } from './instagram.service';

@Module({
  imports: [],
  controllers: [InstagramController],
  providers: [InstagramService],
})
export class InstagramModule {}
