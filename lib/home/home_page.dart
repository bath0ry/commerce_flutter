import 'package:commerce_flutter/components/view/clothings_products.dart';
import 'package:commerce_flutter/components/view/divison.dart';
import 'package:commerce_flutter/components/view/eletronics_products.dart';
import 'package:commerce_flutter/components/view/header.dart';
import 'package:commerce_flutter/components/view/allproducts.dart';
import 'package:commerce_flutter/components/view/jewelery_products.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pagesDestination = [
      Products(),
      EletronicsProducts(),
      Jewelery(),
      Clothings()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.computer), label: 'Eletronics'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Jewelery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall), label: 'Clothing'),
        ],
        currentIndex: _currentPage,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
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
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: DivisonWidget(),
              ),
            ],
          ),
          pagesDestination.elementAt(_currentPage)
        ],
      ),
    );
  }
}
