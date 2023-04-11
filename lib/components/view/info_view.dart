import 'package:commerce_flutter/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/items_model.dart';
import '../../data/models/store_model.dart';

class InfoPageWidget extends StatelessWidget {
  const InfoPageWidget(
      {super.key,
      required this.imageProduct,
      required this.titleProduct,
      required this.descriptionProduct,
      required this.priceProduct,
      required this.data,
      required this.ratingProduct});
  final String imageProduct;
  final String titleProduct;
  final String descriptionProduct;
  final double priceProduct;
  final Rating ratingProduct;
  final List<StoreModel> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 60),
        child: Container(
          height: 800,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border(
                top: BorderSide(width: 1, color: Colors.black),
                bottom: BorderSide(width: 1, color: Colors.black),
                left: BorderSide(width: 1, color: Colors.black),
                right: BorderSide(width: 1, color: Colors.black)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    titleProduct,
                    style: GoogleFonts.cantoraOne(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1, 2),
                            blurRadius: 25.0,
                            color: Color.fromARGB(255, 100, 100, 100),
                          ),
                        ])),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.network(
                    imageProduct,
                    width: 250,
                    height: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$' '$priceProduct',
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cantoraOne(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 3),
                              blurRadius: 8.0,
                              color: Color.fromARGB(255, 100, 100, 100),
                            ),
                          ])),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star),
                      Text(
                        '${ratingProduct.rate}',
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cantoraOne(
                            textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '$descriptionProduct',
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cantoraOne(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
