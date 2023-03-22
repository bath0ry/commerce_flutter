import 'package:commerce_flutter/themes/themes_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DivisonWidget extends StatelessWidget {
  const DivisonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(border: Border.all(color: ThemeColors.divisionColor)),
    );
  }
}
