import 'package:commerce_flutter/components/view/clothings_products.dart';
import 'package:commerce_flutter/components/view/divison.dart';
import 'package:commerce_flutter/components/view/eletronics_products.dart';
import 'package:commerce_flutter/components/view/header.dart';
import 'package:commerce_flutter/components/view/allproducts.dart';
import 'package:commerce_flutter/components/view/jewelery_products.dart';
import 'package:commerce_flutter/pages/sale_page.dart';

import 'package:flutter/material.dart';

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
      const Products(),
      const EletronicsProducts(),
      const Jewelery(),
      const Clothings()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
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
              const Header(),
              Center(
                child: Text(
                  'Hi! Gh Store',
                  style: GoogleFonts.oleoScriptSwashCaps(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Sales()));
                  },
                  child: Image.asset(
                    'assets/images/Captura de tela 2023-03-25 164656.png',
                    height: 150,
                    width: 300,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
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
