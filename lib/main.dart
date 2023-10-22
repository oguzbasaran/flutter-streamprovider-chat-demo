import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/chat_provider.dart';
import './ui/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        title: 'Chat App with StreamProvider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChatScreen(),
      ),
    );
  }
}
