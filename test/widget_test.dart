import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:commerce_flutter/main.dart';

void main() {
  test('Items cart must be add', () {
    final item = ItemsStore(itemsCart: [], data: []);
  });
}
