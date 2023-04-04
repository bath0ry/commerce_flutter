import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:flutter/cupertino.dart';

class ItemsStore extends ChangeNotifier {
  List<StoreModel> itemsCart = [];
  ItemsStore({required this.itemsCart});

  void addItem(StoreModel item) {
    itemsCart.add(item);
    notifyListeners();
  }
}
