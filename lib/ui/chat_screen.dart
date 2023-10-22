import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/message_model.dart';
import '../providers/chat_provider.dart';
import 'message_widget.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Message>>(
      create: (context) =>
          Provider.of<ChatProvider>(context, listen: false).messagesStream,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(title: Text("Chat")),
        body: Column(
          children: [
            Expanded(
              child: Consumer<List<Message>>(
                builder: (context, messages, child) => ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                      MessageWidget(message: messages[index]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration:
                          InputDecoration(hintText: "Enter your message..."),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      Provider.of<ChatProvider>(context, listen: false)
                          .sendMessage(_controller.text);
                      _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
