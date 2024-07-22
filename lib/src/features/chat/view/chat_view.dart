import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:ai_order_bot/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Order Bot 🤖'),
      ),
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ScrollableColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                padding: EdgeInsets.all(AppSpacing.lg),
                children: [
                  Text('Hello! How can I help you today?'),
                  VSpace.md(),
                  Text('Hi! I would like to order a pizza.'),
                  VSpace.md(),
                  Text('Sure! What size would you like?'),
                  VSpace.md(),
                  Text('Medium, please.'),
                  VSpace.md(),
                  Text('What toppings would you like?'),
                  VSpace.md(),
                  Text('Pepperoni and mushrooms.'),
                  VSpace.md(),
                  Text('Great! Anything else?'),
                  VSpace.md(),
                  Text('No, that will be all.'),
                  VSpace.md(),
                  Text('Your order will be ready in 20 minutes.'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: TextField(
                decoration: InputDecoration(hintText: 'Type a message...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
