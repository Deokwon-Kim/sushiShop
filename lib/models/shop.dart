import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
      name: 'Salmon Sushi',
      price: '20,000',
      imagePath: 'lib/images/salmon_sushi.png',
      rating: '4.8',
    ),

    Food(
      name: 'Tuna Sushi',
      price: '15,000',
      imagePath: 'lib/images/tuna_sushi.png',
      rating: '4.8',
    ),
    Food(
      name: 'Salmon Egg Sushi',
      price: '10,000',
      imagePath: 'lib/images/salmon_egg.png',
      rating: '4.8',
    ),
    Food(
      name: 'Sushi Set',
      price: '10,000',
      imagePath: 'lib/images/sushi.png',
      rating: '4.8',
    ),
  ];

  // cutomer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add food to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove food from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
