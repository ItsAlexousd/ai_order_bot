// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      restaurantName: json['restaurantName'] as String,
      restaurantType: json['restaurantType'] as String,
      orderDetails: json['orderDetails'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'restaurantName': instance.restaurantName,
      'restaurantType': instance.restaurantType,
      'orderDetails': instance.orderDetails,
      'price': instance.price,
    };
