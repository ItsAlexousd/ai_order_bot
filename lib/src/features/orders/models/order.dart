import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// {@template order}
/// Represents an order placed by a user.
/// {@endtemplate}
@freezed
class Order with _$Order {
  /// {@macro order}
  const factory Order({
    required String userId,
    required DateTime date,
    required String restaurantName,
    required String restaurantType,
    required String orderDetails,
    required double price,
  }) = _Order;

  const Order._();

  /// Creates a [Order] object from a JSON object.
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
