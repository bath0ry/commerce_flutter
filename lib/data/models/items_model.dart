import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class ItemsStore extends ChangeNotifier {
  List<StoreModel> itemsCart = [];

  int itemsQuanty = 1;

  ItemsStore({
    required this.itemsCart,
    required this.data,
  });

  final List<StoreModel> data;
  void addItem(StoreModel item) {
    itemsCart.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    itemsCart.removeAt(item);
    notifyListeners();
  }

  void incrementItem(int item) {
    if (itemsQuanty < 5) {
      itemsQuanty++;
    }

    notifyListeners();
  }

  void decrementItem(int item) {
    if (itemsQuanty > 1) {
      itemsQuanty--;
    }

    notifyListeners();
  }
}
