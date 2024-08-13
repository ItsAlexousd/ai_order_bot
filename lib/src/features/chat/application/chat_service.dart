import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'chat_service.g.dart';

const _userId = 'user123';

class ChatService {
  ChatService(this.ref);

  final Ref ref;

  final _messagesStreamController = BehaviorSubject<List<Message>>.seeded([]);
  Stream<List<Message>> get messagesStream => _messagesStreamController.stream;

  late ChatSession _chat;
  ChatRepository get _chatRepository => ref.read(chatRepositoryProvider);

  void startChat() {
    _chat = _chatRepository.startChat(_userId);
    _addMessage('bot', 'Bonjour, comment puis-je vous aider ?');
  }

  Future<void> sendMessage(String message) async {
    _addMessage('user', message);
    final response = await _chatRepository.sendMessage(_chat, message);
    _addMessage('bot', response);
  }

  void _addMessage(String sender, String text) {
    _messagesStreamController.sink.add([
      ..._messagesStreamController.value,
      Message(
        sender: sender,
        text: text,
        timestamp: DateTime.now(),
      ),
    ]);
  }
}

@Riverpod(keepAlive: true)
ChatService chatService(ChatServiceRef ref) {
  return ChatService(ref);
}

@riverpod
Stream<List<Message>> messagesStream(MessagesStreamRef ref) {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.messagesStream;
}
