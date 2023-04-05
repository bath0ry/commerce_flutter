import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:commerce_flutter/themes/themes_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ItemsStore(itemsCart: [], data: [], itemsQuanty: 0),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme,
      home: const HomePage(),
    );
  }
}
