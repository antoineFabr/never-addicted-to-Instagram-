import 'package:messagerie_app/data/message.dart';
import 'package:flutter/material.dart';

class Chatcontroller {
  ValueNotifier<List<Message>> messagesNotifier = ValueNotifier([]);

  void sendMessage(String text, {bool isMe = true}) {
    final newMessage = Message(message: text, idClient: 1);
    messagesNotifier.value = [...messagesNotifier.value, newMessage];
  }
}
