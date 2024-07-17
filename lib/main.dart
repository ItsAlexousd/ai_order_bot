import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Order Bot',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AI Order Bot 🤖'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
