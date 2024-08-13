import 'package:ai_order_bot/src/exceptions/exceptions.dart';
import 'package:ai_order_bot/src/utils/utils.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repository.g.dart';

/// {@template chat_exception}
/// Base class for all chat-related exceptions.
/// {@endtemplate}
sealed class ChatException extends AppException {
  /// {@macro chat_exception}
  ChatException(super.code, super.message);
}

/// {@template start_chat_exception}
/// Exception thrown when starting a chat session fails.
/// {@endtemplate}
class StartChatException extends ChatException {
  /// {@macro start_chat_exception}
  StartChatException() : super('start_chat_failed', 'Failed to start chat');
}

/// {@template send_message_exception}
/// Exception thrown when sending a message fails.
/// {@endtemplate}
class SendMessageException extends ChatException {
  /// {@macro send_message_exception}
  SendMessageException()
      : super('send_message_failed', 'Failed to send message');
}

/// {@template chat_repository}
/// Repository which manages chat data.
/// {@endtemplate}
class ChatRepository {
  /// {@macro chat_repository}
  ChatRepository({
    required FirebaseVertexAI vertexAI,
  }) : _vertexAI = vertexAI;

  final FirebaseVertexAI _vertexAI;

  late GenerativeModel _model;

  ChatSession startChat(String userId) {
    try {
      // Initialize the generative model
      _model = _vertexAI.generativeModel(
        model: 'gemini-1.5-flash',
        systemInstruction: Content.system('''
          ${SystemInstructionsPrompts.restaurantOrderingPrompt}.
          La semaine commence le lundi et se termine le dimanche.
          L'ID de l'utilisateur est $userId, et la date du jour est ${DateTime.now()}
        '''),
        tools: [
          Tool(
            functionDeclarations: [
              FunctionDeclarations.getRestaurantTypesVisitedByUserTool,
              FunctionDeclarations.getOrdersFromDateRangeTool,
              FunctionDeclarations.placeOrderTool,
            ],
          ),
        ],
      );

      // Return a new chat session
      return _model.startChat();
    } catch (_, stackTrace) {
      Error.throwWithStackTrace(StartChatException(), stackTrace);
    }
  }

  Future<String> sendMessage(ChatSession chat, String message) async {
    try {
      final parts = [TextPart(message)];

      var response = await chat.sendMessage(Content.multi(parts));

      final functionCalls = response.functionCalls.toList();
      if (functionCalls.isNotEmpty) {
        for (final functionCall in functionCalls) {
          ModelDebugingTools.printDebug(
            '${functionCall.name} ${functionCall.args}',
          );

          final result =
              await FunctionDeclarations.handleFunctionCall(functionCall);

          response = await chat.sendMessage(
            Content.functionResponse(
              functionCall.name,
              result,
            ),
          );
        }
      }

      return response.text!;
    } catch (_, stackTrace) {
      Error.throwWithStackTrace(SendMessageException(), stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepository(vertexAI: FirebaseVertexAI.instance);
}
