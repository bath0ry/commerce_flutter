import 'package:commerce_flutter/models/store_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../models/service/store_service.dart';

class Clothings extends StatefulWidget {
  const Clothings({super.key});

  @override
  State<Clothings> createState() => _ClothingsState();
}

class _ClothingsState extends State<Clothings> {
  late final StoreService service;
  void initState() {
    service = StoreService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          final indexes = [0, 1, 2, 3, 14, 15, 16, 17, 18, 19];
          final selectedData = indexes.map((e) => data[e]).toList();

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: selectedData.length,
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
                                top: BorderSide(width: 1, color: Colors.black),
                                bottom:
                                    BorderSide(width: 1, color: Colors.black),
                                left: BorderSide(width: 1, color: Colors.black),
                                right:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  selectedData[index].title,
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
                                  selectedData[index].image,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '\$'
                                    '${selectedData[index].price.toString()}',
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
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(10),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(120, 0)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
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
      future: service.getStore(),
    );
  }
}
