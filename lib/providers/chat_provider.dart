import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../services/fake_api_service.dart';

class ChatProvider with ChangeNotifier {
  final FakeApiService _apiService = FakeApiService();

  Stream<List<Message>> get messagesStream => _apiService.messagesStream;

  void sendMessage(String content) {
    _apiService.addMessage(
        Message(sender: "Me", content: content, timestamp: DateTime.now()));
  }
}
