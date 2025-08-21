import { Controller, Get, Param } from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get(':id')
  getUserById(@Param('id') param: string): any {
    console.log(param);
    const id = Number(param);
    console.log(id);
    return this.userService.getUserById(id);
  }
}
