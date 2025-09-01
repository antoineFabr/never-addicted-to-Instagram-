import 'package:flutter/material.dart';
import 'package:messagerie_app/data/message.dart';
import 'package:messagerie_app/services/chatcontroller.dart';

class AffichageMessage extends StatefulWidget {
  final Chatcontroller controller;
  const AffichageMessage({super.key, required this.controller});

  @override
  State<AffichageMessage> createState() => _AffichageMessageState();
}

class _AffichageMessageState extends State<AffichageMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder<List<Message>>(
            valueListenable: widget.controller.messagesNotifier,
            builder: (context, messages, _) {
              if (messages.isEmpty) {
                return const Center(child: Text('Start a conversation'));
              }
              return ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return InkWell(
                    splashColor: const Color.fromARGB(255, 130, 3, 235),
                    onLongPress: () {},
                    child: Container(
                      height: 20,
                      width: 20,
                      color: const Color.fromARGB(255, 0, 204, 184),
                      child: Text(message.message),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
