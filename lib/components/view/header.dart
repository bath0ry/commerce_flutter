import 'package:commerce_flutter/themes/themes_colors.dart';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: ThemeColors.gradienteColorsHeader,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              splashRadius: 1,
              onPressed: () {},
              icon: const Icon(Icons.menu),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ThemeColors.primaryColor)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 1,
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ThemeColors.primaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}
