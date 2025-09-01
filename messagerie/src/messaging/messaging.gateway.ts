import {
  SubscribeMessage,
  MessageBody,
  WebSocketGateway,
  OnGatewayConnection,
  OnGatewayDisconnect,
  WebSocketServer,
  ConnectedSocket,
} from '@nestjs/websockets';
import { MessagingService } from './messaging.service';
import { Server, Socket } from 'socket.io';

@WebSocketGateway({ cors: true })
export class MessagingGateway
  implements OnGatewayConnection, OnGatewayDisconnect
{
  @WebSocketServer()
  server: Server;

  constructor(private readonly messagingService: MessagingService) {}

  handleConnection(client: Socket) {
    console.log(`Client connecté ${client.id}`);
  }

  handleDisconnect(client: Socket) {
    console.log(`client deconnecté ${client.id}`);
  }

  @SubscribeMessage('message')
  handleEvent(
    @MessageBody() data: string,
    @ConnectedSocket() client: Socket,
  ): string {
    console.log(`client ${client.id} a envoyer ${data}`);
    client.broadcast.emit('message', data);

    return data;
  }

  @SubscribeMessage('join PrivateRoom')
  handleJoinRoom(
    @MessageBody() room: string,
    @ConnectedSocket() client: Socket,
  ) {
    client.join(room);
    console.log(`client ${client.id} a rejoint la room ${room}`);

    client.to(room).emit('message', `le client ${client.id} a rejoint la room`);
  }
}
