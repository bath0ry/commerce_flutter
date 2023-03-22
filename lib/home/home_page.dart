import 'package:commerce_flutter/components/view/box_cattegory.dart';
import 'package:commerce_flutter/components/view/divison.dart';
import 'package:commerce_flutter/components/view/header.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DivisonWidget(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
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
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Produtos',
              style: GoogleFonts.eduNswActFoundation(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
