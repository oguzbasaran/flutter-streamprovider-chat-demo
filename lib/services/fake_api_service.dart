import 'dart:async';
import '../models/message_model.dart';

class FakeApiService {
  final List<Message> _messages = [];

  final StreamController<List<Message>> _messageController =
      StreamController<List<Message>>.broadcast();

  FakeApiService() {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        addMessage(Message(
            sender: "User${timer.tick}",
            content: "This is message ${timer.tick}",
            timestamp: DateTime.now()));
      },
    );
  }

  Stream<List<Message>> get messagesStream => _messageController.stream;

  void addMessage(Message message) {
    _messages.add(message);
    _messageController.add(List.from(_messages));
  }

  void dispose() {
    _messageController.close();
  }
}
