import 'dart:async';

import 'package:flutter_shopping_cart/catalog/catalog.dart';

class ShoppingRepository {
  static const delay = Duration(milliseconds: 800);

  static const catalog = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  final _items = <Item>[];

  Future<List<String>> loadCatalog() => Future.delayed(delay, () => catalog);

  Future<List<Item>> loadCartItems() => Future.delayed(delay, () => _items);

  void addItemToCart(Item item) => _items.add(item);

  void removeItemFromCart(Item item) => _items.remove(item);
}
