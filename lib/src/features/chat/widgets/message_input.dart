import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MessageInput extends ConsumerStatefulWidget {
  const MessageInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessageInputState();
}

class _MessageInputState extends ConsumerState<MessageInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messageInputControllerProvider);
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Type a message...',
        suffixIcon: GestureDetector(
          onTap: !state.isLoading
              ? () async {
                  final message = _controller.text.trim();
                  if (message.isEmpty) return;
                  _controller.clear();
                  await ref
                      .read(messageInputControllerProvider.notifier)
                      .sendMessage(message);
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: PhosphorIcon(
              PhosphorIconsRegular.paperPlaneRight,
              size: 24,
              color: !state.isLoading ? AppColor.white : AppColor.gray,
            ),
          ),
        ),
      ),
      readOnly: state.isLoading,
    );
  }
}
