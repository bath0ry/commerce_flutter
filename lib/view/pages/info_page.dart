import 'package:commerce_flutter/components/view/info_view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/models/store_model.dart';

class InfoPage extends StatelessWidget {
  final String imageProduct;
  final String titleProduct;
  final String descriptionProduct;
  final double priceProduct;
  final Rating ratingProduct;
  final Category categoryProduct;
  final int idProduct;
  const InfoPage(
      {super.key,
      required this.imageProduct,
      required this.titleProduct,
      required this.descriptionProduct,
      required this.priceProduct,
      required this.ratingProduct,
      required this.idProduct,
      required this.categoryProduct});

  @override
  Widget build(BuildContext context) {
    return InfoPageWidget(
      imageProduct: imageProduct,
      titleProduct: titleProduct,
      descriptionProduct: descriptionProduct,
      priceProduct: priceProduct,
      data: [],
      ratingProduct: ratingProduct,
      idProduct: idProduct,
      categoryProduct: categoryProduct,
    );
  }
}
