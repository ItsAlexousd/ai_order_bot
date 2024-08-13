import 'package:ai_order_bot/src/app/app.dart';
import 'package:ai_order_bot/src/exceptions/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Helper class to initialize services and configure the error handlers.
class AppBootstrap {
  /// Create the root widget that should be passed to [runApp].
  Widget createRootWidget() {
    // * Create the ProviderContainer and read the providers
    final container = ProviderContainer(observers: [AsyncErrorLogger()]);

    // * Register error handlers. For more info, see: https://docs.flutter.dev/testing/errors
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    return UncontrolledProviderScope(
      container: container,
      child: const App(),
    );
  }

  /// Register Flutter error handlers.
  void registerErrorHandlers(ErrorLogger errorLogger) {
    // * Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };

    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };

    // * Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('An error occurred'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }
}
