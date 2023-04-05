import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class ItemsStore extends ChangeNotifier {
  List<StoreModel> itemsCart = [];

  int itemsQuanty;
  ItemsStore(
      {required this.itemsCart, required this.data, required this.itemsQuanty});

  final List<StoreModel> data;
  void addItem(StoreModel item) {
    itemsCart.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    itemsCart.removeAt(item);
    notifyListeners();
  }

  void incrementItem(item) {
    if (itemsQuanty < 5) {
      itemsQuanty++;
    }

    notifyListeners();
  }

  void decrementItem(item) {
    if (itemsQuanty > 1) {
      itemsQuanty--;
    }

    notifyListeners();
  }
}
