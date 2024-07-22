import 'package:ai_order_bot/src/app/app.dart';
import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'AI Order Bot',
      theme: ThemeData.dark(useMaterial3: false).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.white,
          primary: AppColor.white,
          secondary: AppColor.yellow,
          error: AppColor.red,
        ),
        scaffoldBackgroundColor: AppColor.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.dark,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColor.dark,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.gray),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(16),
          ),
          hintStyle: const TextStyle(color: AppColor.gray),
          filled: true,
          isDense: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
