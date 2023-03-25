import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:commerce_flutter/themes/themes_colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  late final StoreService service;
  void initState() {
    service = StoreService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> newPrices = [
      '60.0',
      '100.0',
      '105.0',
      '110.0',
      '500.0',
      '900.0'
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('erro'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<StoreModel> data = snapshot.data as List<StoreModel>;

            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 700,
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 60, bottom: 60),
                          child: Container(
                            height: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              border: Border(
                                  top:
                                      BorderSide(width: 1, color: Colors.black),
                                  bottom:
                                      BorderSide(width: 1, color: Colors.black),
                                  left:
                                      BorderSide(width: 1, color: Colors.black),
                                  right: BorderSide(
                                      width: 1, color: Colors.black)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    data[index].title,
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cantoraOne(
                                        textStyle: const TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.network(
                                    data[index].image,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '\$'
                                          '${data[index].price}',
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
                                                      color: Color.fromARGB(
                                                          255, 100, 100, 100),
                                                    ),
                                                  ],
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                        ),
                                        Text(
                                          '\$'
                                          '${newPrices[index]}',
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
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100),
                                                ),
                                              ])),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(10),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(120, 0)),
                                          backgroundColor: MaterialStateProperty.all(
                                              Colors.black),
                                          shadowColor: MaterialStateProperty.all(
                                              const Color.fromARGB(255, 77, 77, 77))),
                                      child: Text('Add to cart',
                                          style: GoogleFonts.cantoraOne(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18))),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
        future: service.getElectronics(),
      ),
    );
  }
}
