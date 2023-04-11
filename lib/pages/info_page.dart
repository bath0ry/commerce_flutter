import 'package:commerce_flutter/components/view/info_view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoPage extends StatelessWidget {
  final String imageProduct;
  final String titleProduct;
  final String descriptionProduct;
  final double priceProduct;
  const InfoPage(
      {super.key,
      required this.imageProduct,
      required this.titleProduct,
      required this.descriptionProduct,
      required this.priceProduct});

  @override
  Widget build(BuildContext context) {
    return InfoPageWidget(
      imageProduct: imageProduct,
      titleProduct: titleProduct,
      descriptionProduct: descriptionProduct,
      priceProduct: priceProduct,
      data: [],
    );
  }
}
