import 'package:flutter/material.dart';
import 'package:messagerie_app/views/widgets/affichage_message.dart';
import 'package:messagerie_app/services/chatcontroller.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final Chatcontroller chatController = Chatcontroller();
  void _pubMessage(String text) {
    if (text.isEmpty) return;
    chatController.sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: AffichageMessage(controller: chatController)),
        TextField(
          onSubmitted: (value) => _pubMessage(value),
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
