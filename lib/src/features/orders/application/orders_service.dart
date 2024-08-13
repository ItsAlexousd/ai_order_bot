// ignore_for_file: lines_longer_than_80_chars

import 'package:ai_order_bot/src/features/orders/orders.dart';

class OrdersService {
  OrdersService() {
    _orders = _createOrdersFromJson(_ordersData);
  }

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  // Get the list of restaurant types visited by a user.
  List<String> getRestaurantTypesVisitedByUser(String userId) {
    return _orders
        .where((order) => order.userId == userId)
        .map((order) => order.restaurantType)
        .toSet()
        .toList();
  }

  // Get orders within a date range.
  // The orders contains information about what items the user ordered,
  // date, restaurant name, restaurant type, and price.
  List<Order> getOrdersFromDateRange(
    String userId,
    DateTime startDate,
    DateTime endDate,
  ) {
    final normalizedStartDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    final normalizedEndDate = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
    );

    return _orders.where((order) {
      if (order.userId != userId) return false;
      return order.date.compareTo(normalizedStartDate) >= 0 &&
          order.date.compareTo(normalizedEndDate) <= 0;
    }).toList();
  }

  void placeOrder(Order order) {
    _orders.add(order);
  }

  List<Order> _createOrdersFromJson(List<Map<String, dynamic>> data) {
    return data.map(Order.fromJson).toList();
  }
}

const _ordersData = [
  {
    'userId': 'user123',
    'date': '2024-06-01T12:35:18.000',
    'restaurantName': 'Palais du Curry',
    'restaurantType': 'Indien',
    'orderDetails':
        "1 x Poulet au beurre, 1 x Pain naan à l'ail, 1 x Lassi à la mangue, 1 x Samosa aux légumes",
    'price': 25.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-02T19:15:42.000',
    'restaurantName': 'Planète Pizza',
    'restaurantType': 'Italien',
    'orderDetails':
        "1 x Pizza Pepperoni (Grande), 1 x Salade César, 2 x Noix d'ail",
    'price': 22.99,
  },
  {
    'userId': 'user123',
    'date': '2024-06-04T14:08:11.000',
    'restaurantName': 'Délice Thaï',
    'restaurantType': 'Thaï',
    'orderDetails':
        '1 x Pad Thaï, 1 x Soupe Tom Yum, 1 x Curry vert, 1 x Riz au jasmin',
    'price': 30.75,
  },
  {
    'userId': 'user123',
    'date': '2024-06-06T20:45:36.000',
    'restaurantName': 'Le Buffet Burger',
    'restaurantType': 'Américain',
    'orderDetails':
        '1 x Double Cheeseburger, 1 x Frites, 1 x Oignons frits, 1 x Milkshake au chocolat',
    'price': 18.99,
  },
  {
    'userId': 'user123',
    'date': '2024-06-07T11:22:59.000',
    'restaurantName': 'Pho Réel',
    'restaurantType': 'Vietnamien',
    'orderDetails':
        '1 x Pho Tai, 1 x Rouleaux de printemps (2 pcs), 1 x Banh Mi au porc grillé',
    'price': 20.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-09T18:10:23.000',
    'restaurantName': 'Ville des Tacos',
    'restaurantType': 'Mexicain',
    'orderDetails':
        '2 x Tacos au poulet, 1 x Taco au boeuf, 1 x Guacamole et chips, 1 x Churros',
    'price': 16.80,
  },
  {
    'userId': 'user123',
    'date': '2024-06-11T13:58:07.000',
    'restaurantName': 'Le Quotidien Café',
    'restaurantType': 'Café',
    'orderDetails':
        '1 x Latte, 1 x Croissant, 1 x Muffin aux myrtilles, 1 x Thé glacé',
    'price': 12.95,
  },
  {
    'userId': 'user123',
    'date': '2024-06-13T21:35:18.000',
    'restaurantName': 'Délices Grecs',
    'restaurantType': 'Grec',
    'orderDetails':
        '1 x Plateau Gyro, 1 x Salade grecque, 1 x Spanakopita, 1 x Baklava',
    'price': 26.95,
  },
  {
    'userId': 'user123',
    'date': '2024-06-15T16:05:34.000',
    'restaurantName': 'Paradis Sushi',
    'restaurantType': 'Japonais',
    'orderDetails':
        '1 x Rouleau de thon épicé, 1 x Rouleau Dragon, 1 x Nigiri au saumon (2 pcs), 1 x Soupe miso',
    'price': 27.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-16T12:22:47.000',
    'restaurantName': 'Arrêt des Ailes',
    'restaurantType': 'Américain',
    'orderDetails':
        '15 x Ailes de poulet Buffalo, 1 x Frites, 1 x Oignons frits, 1 x Sauce ranch',
    'price': 20.75,
  },
  {
    'userId': 'user123',
    'date': '2024-06-18T19:45:02.000',
    'restaurantName': 'Perfection des Pâtes',
    'restaurantType': 'Italien',
    'orderDetails':
        "1 x Fettuccine Alfredo, 1 x Lasagne, 1 x Pain à l'ail, 1 x Tiramisu",
    'price': 31.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-20T15:58:39.000',
    'restaurantName': 'BBQ Coréen',
    'restaurantType': 'Coréen',
    'orderDetails':
        '1 x Bulgogi, 1 x Galbi, 1 x Kimchi, 1 x Japchae, 1 x Bibimbap',
    'price': 42.00,
  },
  {
    'userId': 'user123',
    'date': '2024-06-22T11:30:15.000',
    'restaurantName': 'Le Bar à Salades',
    'restaurantType': 'Sain',
    'orderDetails': '1 x Salade Cobb, 1 x Salade grecque, 1 x Coupe de fruits',
    'price': 15.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-23T22:15:56.000',
    'restaurantName': 'Maison des Dim Sum',
    'restaurantType': 'Chinois',
    'orderDetails':
        '4 x Raviolis aux crevettes, 3 x Buns au porc, 2 x Rouleaux de printemps, 2 x Har Gow',
    'price': 23.25,
  },
  {
    'userId': 'user123',
    'date': '2024-06-25T17:45:28.000',
    'restaurantName': 'La Cabane à Côtes',
    'restaurantType': 'BBQ',
    'orderDetails':
        '1 x Sandwich au porc effiloché, 1 x Mac & Cheese, 1 x Salade de chou, 1 x Thé sucré',
    'price': 17.50,
  },
  {
    'userId': 'user123',
    'date': '2024-06-27T13:18:09.000',
    'restaurantName': 'Le Marché des Fruits de Mer',
    'restaurantType': 'Fruits de mer',
    'orderDetails':
        '1 x Roll de homard, 1 x Chowder aux palourdes, 1 x Calamars frits, 1 x Limonade',
    'price': 28.75,
  },
  {
    'userId': 'user123',
    'date': '2024-06-29T20:05:43.000',
    'restaurantName': 'Le Nid du Petit Déjeuner',
    'restaurantType': 'Petit-déjeuner',
    'orderDetails':
        "1 x Crêpes, 2 x Œufs, 1 x Saucisse, 1 x Café, 1 x Jus d'orange",
    'price': 14.99,
  },
  {
    'userId': 'user123',
    'date': '2024-06-31T10:32:21.000',
    'restaurantName': 'Le Bistro Français',
    'restaurantType': 'Français',
    'orderDetails':
        "1 x Croque Monsieur, 1 x Soupe à l'oignon, 1 x Frites, 1 x Crème Brûlée",
    'price': 25.50,
  },
  {
    'userId': 'user123',
    'date': '2024-07-02T16:55:17.000',
    'restaurantName': 'La Steakhouse',
    'restaurantType': 'Steakhouse',
    'orderDetails':
        '1 x Steak New York Strip, 1 x Pomme de terre au four, 1 x Salade César, 1 x Vin rouge',
    'price': 45.00,
  },
  {
    'userId': 'user123',
    'date': '2024-07-04T12:48:52.000',
    'restaurantName': 'La Sandwicherie',
    'restaurantType': 'Sandwich',
    'orderDetails':
        '1 x Club au dinde, 1 x Chips de pomme de terre, 1 x Cornichon, 1 x Thé glacé',
    'price': 10.50,
  },
  {
    'userId': 'user123',
    'date': '2024-07-06T19:22:36.000',
    'restaurantName': 'Le Bar à Sushi',
    'restaurantType': 'Japonais',
    'orderDetails':
        '1 x Rouleau Californien, 1 x Rouleau Arc-en-ciel, 1 x Edamame, 1 x Thé vert',
    'price': 21.75,
  },
  {
    'userId': 'user123',
    'date': '2024-07-08T15:15:11.000',
    'restaurantName': 'La Pizzeria',
    'restaurantType': 'Italien',
    'orderDetails':
        "1 x Pizza Margherita, 1 x Noix d'ail, 1 x Coke, 1 x Tiramisu",
    'price': 18.99,
  },
  {
    'userId': 'user123',
    'date': '2024-07-10T21:58:47.000',
    'restaurantName': 'Le Bol à Burrito',
    'restaurantType': 'Mexicain',
    'orderDetails':
        '1 x Bol de Burrito au poulet, 1 x Guacamole et chips, 1 x Horchata',
    'price': 14.50,
  },
  {
    'userId': 'user123',
    'date': '2024-08-01T11:42:23.000',
    'restaurantName': 'Le Comptoir à Ramen',
    'restaurantType': 'Japonais',
    'orderDetails': '1 x Ramen Shoyu, 1 x Gyoza, 1 x Thé glacé',
    'price': 16.25,
  },
  {
    'userId': 'user123',
    'date': '2024-08-02T17:35:59.000',
    'restaurantName': 'La Cabane à Poulet',
    'restaurantType': 'Américain',
    'orderDetails':
        '1 x Sandwich au poulet frit, 1 x Frites, 1 x Salade de chou, 1 x Limonade',
    'price': 12.75,
  },
  {
    'userId': 'user123',
    'date': '2024-08-03T13:28:34.000',
    'restaurantName': 'La Cuisine de Soupe',
    'restaurantType': 'Soupe',
    'orderDetails':
        '1 x Soupe de tomate, 1 x Sandwich au fromage grillé, 1 x Salade',
    'price': 11.50,
  },
  {
    'userId': 'user123',
    'date': '2024-08-05T20:12:10.000',
    'restaurantName': 'Le Café du Moyen-Orient',
    'restaurantType': 'Moyen-Oriental',
    'orderDetails':
        '1 x Plateau de Falafel, 1 x Houmous, 1 x Pain pita, 1 x Thé à la menthe',
    'price': 19.99,
  },
  {
    'userId': 'user123',
    'date': '2024-08-06T16:05:46.000',
    'restaurantName': 'Le Bistro Vegan',
    'restaurantType': 'Végétalien',
    'orderDetails': '1 x Burger vegan, 1 x Frites, 1 x Salade, 1 x Limonade',
    'price': 15.25,
  },
  {
    'userId': 'user123',
    'date': '2024-08-08T12:58:22.000',
    'restaurantName': 'La Maison du Curry Indien',
    'restaurantType': 'Indien',
    'orderDetails':
        '1 x Poulet Tikka Masala, 1 x Pain naan, 1 x Riz, 1 x Lassi à la mangue',
    'price': 22.50,
  },
  {
    'userId': 'user123',
    'date': '2024-08-09T19:42:08.000',
    'restaurantName': 'Emporter Chinois',
    'restaurantType': 'Chinois',
    'orderDetails':
        '1 x Poulet Kung Pao, 1 x Riz frit, 1 x Rouleau de printemps, 1 x Soda',
    'price': 16.75,
  },
  {
    'userId': 'user123',
    'date': '2024-08-11T10:25:33.000',
    'restaurantName': 'Le Deli Italien',
    'restaurantType': 'Italien',
    'orderDetails':
        '1 x Sous-marin italien, 1 x Chips de pomme de terre, 1 x Cornichon, 1 x Thé glacé',
    'price': 11.99,
  }
];
