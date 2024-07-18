import 'package:ai_order_bot/firebase_options.dart';
import 'package:ai_order_bot/src/app_bootstrap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Create an app bootstrap instance
  final appBootstrap = AppBootstrap();

  // Create the root widget
  final root = appBootstrap.createRootWidget();

  // Start the app
  runApp(root);
}
