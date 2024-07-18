import 'package:ai_order_bot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
