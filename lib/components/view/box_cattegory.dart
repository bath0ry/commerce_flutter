import 'package:commerce_flutter/themes/themes_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BoxCattegory extends StatelessWidget {
  const BoxCattegory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              fixedSize: MaterialStateProperty.all(Size(120, 0)),
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shadowColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53))),
          child: Text(
            'data',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
