import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:ai_order_bot/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
    this.message, {
    super.key,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'user'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.xs,
          horizontal: AppSpacing.sm,
        ),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: message.sender == 'user' ? AppColor.red : AppColor.darkGray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MarkdownBody(data: message.text),
            const VSpace.sm(),
            Text(
              DateFormat('HH:mm').format(message.timestamp),
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
