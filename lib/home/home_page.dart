import 'package:commerce_flutter/components/view/box_cattegory.dart';
import 'package:commerce_flutter/components/view/divison.dart';
import 'package:commerce_flutter/components/view/header.dart';
import 'package:commerce_flutter/components/view/products.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Header(),
              Center(
                child: Text(
                  'Hi! Gh Clothes',
                  style: GoogleFonts.oleoScriptSwashCaps(
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ListView(
                        children: [
                          BoxCattegory(),
                          BoxCattegory(),
                          BoxCattegory(),
                          BoxCattegory(),
                          BoxCattegory(),
                          BoxCattegory(),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: DivisonWidget(),
              )
            ],
          ),
          Products()
        ],
      ),
    );
  }
}
