import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.sender),
      subtitle: Text(message.content),
    );
  }
}
