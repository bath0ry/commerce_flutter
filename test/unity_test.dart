import 'package:commerce_flutter/models/models/items_model.dart';
import 'package:commerce_flutter/models/store_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:commerce_flutter/main.dart';

void main() {
  test('Items cart must be add', () {
    List<StoreModel> itemsCart = [];
    void addItem(StoreModel item) {
      itemsCart.add(item);
    }

    expect(itemsCart, []);
  });
}
