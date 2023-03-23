import 'package:commerce_flutter/themes/themes_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BoxCattegory extends StatelessWidget {
  const BoxCattegory({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(15),
            gradient:
                LinearGradient(colors: ThemeColors.gradienteColorsButtons),
          ),
          child: Center(
            child: Text(
              'data',
            ),
          ),
        ),
      ),
    );
  }
}
