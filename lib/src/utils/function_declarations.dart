import 'package:ai_order_bot/src/features/orders/orders.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';

class FunctionDeclarations {
  static final ordersService = OrdersService();

  // Function callins definitions:
  static final getRestaurantTypesVisitedByUserTool = FunctionDeclaration(
    'getRestaurantTypesVisitedByUser',
    '''
    Renvoie une liste des types de restaurants uniques visités par
    un utilisateur.
    ''',
    Schema(
      SchemaType.object,
      properties: {
        'userId': Schema(
          SchemaType.string,
          description: "L'ID de l'utilisateur.",
        ),
      },
      requiredProperties: [
        'userId',
      ],
    ),
  );

  static final getOrdersFromDateRangeTool = FunctionDeclaration(
    'getOrdersFromDateRange',
    '''
    Renvoie une liste de commandes passées par un utilisateur dans une période
    spécifique. Les commandes contiennent des informations sur les articles
    commandés, la date, le nom du restaurant, le type de restaurant et le prix.
    ''',
    Schema(
      SchemaType.object,
      properties: {
        'userId': Schema(
          SchemaType.string,
          description: "L'ID de l'utilisateur.",
        ),
        'startDate': Schema(
          SchemaType.string,
          description: 'La date de début de la période au format YYYY-MM-DD.',
        ),
        'endDate': Schema(
          SchemaType.string,
          description: 'La date de fin de la période au format YYYY-MM-DD.',
        ),
      },
      requiredProperties: [
        'userId',
        'startDate',
        'endDate',
      ],
    ),
  );

  static final placeOrderTool = FunctionDeclaration(
    'placeOrder',
    '''
    Passe une nouvelle commande pour un utilisateur. Utilisez cette fonction
    pour créer une nouvelle commande et l'envoyer au restaurant.
    ''',
    Schema(
      SchemaType.object,
      properties: {
        'userId': Schema(
          SchemaType.string,
          description: "L'ID de l'utilisateur passant la commande.",
        ),
        'date': Schema(
          SchemaType.string,
          description: 'La date de la commande au format YYYY-MM-DD.',
        ),
        'restaurantName': Schema(
          SchemaType.string,
          description: 'Le nom du restaurant.',
        ),
        'restaurantType': Schema(
          SchemaType.string,
          description: 'Le type de restaurant.',
        ),
        'orderDetails': Schema(
          SchemaType.string,
          description: 'Les détails de la commande.',
        ),
        'price': Schema(
          SchemaType.number,
          description: 'Le prix total de la commande.',
        ),
      },
      requiredProperties: [
        'userId',
        'date',
        'restaurantName',
        'restaurantType',
        'orderDetails',
        'price',
      ],
    ),
  );

  static Future<Map<String, Object?>> handleFunctionCall(
    FunctionCall functionCall,
  ) async {
    switch (functionCall.name) {
      case 'getRestaurantTypesVisitedByUser':
        return {
          'restaurantTypes': ordersService.getRestaurantTypesVisitedByUser(
            _extractStringArg(functionCall.args, 'userId'),
          ),
        };
      case 'getOrdersFromDateRange':
        return {
          'orders': ordersService
              .getOrdersFromDateRange(
                _extractStringArg(functionCall.args, 'userId'),
                _extractDateArg(functionCall.args, 'startDate'),
                _extractDateArg(functionCall.args, 'endDate'),
              )
              .map((order) => order.toJson())
              .toList(),
        };
      case 'placeOrder':
        ordersService.placeOrder(
          Order(
            userId: _extractStringArg(functionCall.args, 'userId'),
            date: _extractDateArg(functionCall.args, 'date'),
            restaurantName:
                _extractStringArg(functionCall.args, 'restaurantName'),
            restaurantType:
                _extractStringArg(functionCall.args, 'restaurantType'),
            orderDetails: _extractStringArg(functionCall.args, 'orderDetails'),
            price: _extractDoubleArg(functionCall.args, 'price'),
          ),
        );
        return {'success': true};
      default:
        throw UnimplementedError(
          'Function not implemented: ${functionCall.name}',
        );
    }
  }

// Helper functions to extract arguments from functionCall.args
  static String _extractStringArg(
    Map<String, Object?> args,
    String key, {
    String defaultValue = '',
  }) {
    return (args[key] as String?) ?? defaultValue;
  }

  static DateTime _extractDateArg(
    Map<String, Object?> args,
    String key, {
    DateTime? defaultValue,
  }) {
    final dateString = args[key] as String?;
    return dateString != null
        ? DateTime.tryParse(dateString) ?? defaultValue!
        : defaultValue!;
  }

  static double _extractDoubleArg(
    Map<String, Object?> args,
    String key, {
    double defaultValue = 0.0,
  }) {
    return (args[key] as num?)?.toDouble() ?? defaultValue;
  }
}
