import 'package:commerce_flutter/models/store_model.dart';
import 'package:flutter/material.dart';

class FavItems extends ChangeNotifier {
  List<StoreModel> favItems = [];
  final List<StoreModel> data;
  bool _isButtonClicked = false;
  FavItems({required this.data, required this.favItems});

  void toggleButton() {
    _isButtonClicked = !_isButtonClicked;
    notifyListeners();
  }

  Icon get favButton {
    if (_isButtonClicked) {
      return Icon(Icons.favorite);
    } else {
      return Icon(Icons.favorite_border);
    }
  }

  void addItem(StoreModel item) {
    favItems.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    favItems.removeAt(item);
    notifyListeners();
  }
}
