import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(chatServiceProvider).startChat();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(messagesStreamProvider, (_, __) => _scrollToBottom());
    final messages = ref.watch(messagesStreamProvider).value ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Order 🍕'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (_, index) => ChatMessage(messages[index]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.md,
                horizontal: AppSpacing.lg,
              ),
              child: MessageInput(),
            ),
          ],
        ),
      ),
    );
  }
}
