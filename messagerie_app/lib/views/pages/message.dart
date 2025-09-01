import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Column(
        children:[ 
          InkWell(
            splashColor: Colors.deepOrange,
            child: Text("Message"),
          ),
          TextFormField(
            
          )
        ]
      )
    );
  }
}
