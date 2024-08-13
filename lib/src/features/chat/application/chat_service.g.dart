// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatServiceHash() => r'fde1c51e9f801d224154441514440fc5159e10ad';

/// See also [chatService].
@ProviderFor(chatService)
final chatServiceProvider = Provider<ChatService>.internal(
  chatService,
  name: r'chatServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatServiceRef = ProviderRef<ChatService>;
String _$messagesStreamHash() => r'afe391a003f832db9c0ab0706746c0ed23e3a61f';

/// See also [messagesStream].
@ProviderFor(messagesStream)
final messagesStreamProvider =
    AutoDisposeStreamProvider<List<Message>>.internal(
  messagesStream,
  name: r'messagesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messagesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MessagesStreamRef = AutoDisposeStreamProviderRef<List<Message>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
