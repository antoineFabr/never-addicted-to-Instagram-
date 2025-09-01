import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MessagingModule } from './messaging/messaging.module';

@Module({
  imports: [MessagingModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
