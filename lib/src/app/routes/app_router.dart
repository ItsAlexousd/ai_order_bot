import 'package:ai_order_bot/src/features/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/chat',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/chat',
        name: 'chat',
        pageBuilder: (_, __) => const NoTransitionPage(
          child: ChatView(),
        ),
      ),
    ],
  );
}
