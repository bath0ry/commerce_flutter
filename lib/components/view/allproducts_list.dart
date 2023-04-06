import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/store_model.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<StoreModel> data;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late final StoreService service;
  void initState() {
    service = StoreService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 450,
        child: ListView.builder(
            itemCount: widget.data.length,
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
                        bottom: BorderSide(width: 1, color: Colors.black),
                        left: BorderSide(width: 1, color: Colors.black),
                        right: BorderSide(width: 1, color: Colors.black)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          widget.data[index].title,
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
                          widget.data[index].image,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '\$' '${widget.data[index].price.toString()}',
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
                          TextButton(
                            onPressed: () {
                              Provider.of<ItemsStore>(context, listen: false)
                                  .addItem(StoreModel(
                                id: widget.data[index].id,
                                title: widget.data[index].title,
                                price: widget.data[index].price,
                                description: widget.data[index].description,
                                category: widget.data[index].category,
                                image: widget.data[index].image,
                                rating: widget.data[index].rating,
                              ));
                            },
                            child: Text('Add to cart',
                                style: GoogleFonts.cantoraOne(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18))),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(120, 0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shadowColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 77, 77, 77))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
