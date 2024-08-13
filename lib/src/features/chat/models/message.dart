import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// {@template message}
/// A message sent by a user or bot.
/// {@endtemplate}
@freezed
class Message with _$Message {
  /// {@macro message}
  const factory Message({
    required String sender,
    required String text,
    required DateTime timestamp,
  }) = _Message;

  const Message._();

  /// Creates a [Message] object from a JSON object.
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
