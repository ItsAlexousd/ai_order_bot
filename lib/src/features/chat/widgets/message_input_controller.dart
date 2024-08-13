import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_input_controller.g.dart';

@riverpod
class MessageInputController extends _$MessageInputController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  Future<void> sendMessage(String message) async {
    final chatService = ref.read(chatServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => chatService.sendMessage(message));
  }
}
