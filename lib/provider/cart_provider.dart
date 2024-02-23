import 'package:petstore/model/pet.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Pet> _items = [];

  List<Pet> get items => _items;

  void addToCart(Pet pet) {
    _items.add(pet);
    notifyListeners();
  }

  void removeFromCart(Pet pet) {
    _items.remove(pet);
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
