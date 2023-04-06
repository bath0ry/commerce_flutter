import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final StoreService service;

  void initState() {
    service = StoreService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'CheckOut',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
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
              child: Consumer<ItemsStore>(builder: (BuildContext context,
                  ItemsStore itemsStore, Widget? widget) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 1,
                                      blurRadius: 15,
                                      blurStyle: BlurStyle.solid)
                                ],
                                border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.black),
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black),
                                    left: BorderSide(
                                        width: 1, color: Colors.black),
                                    right: BorderSide(
                                        width: 1, color: Colors.black)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 8, bottom: 8),
                                    child: Image.network(
                                      itemsStore.itemsCart[index].image,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            itemsStore.itemsCart[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.cantoraOne(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<ItemsStore>(
                                                          context,
                                                          listen: false)
                                                      .decrementItem(index);
                                                },
                                                icon: Icon(Icons.remove)),
                                            Text(
                                              itemsStore.itemsQuanty.toString(),
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<ItemsStore>(
                                                          context,
                                                          listen: false)
                                                      .incrementItem(index);
                                                },
                                                icon: Icon(Icons.add)),
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<ItemsStore>(
                                                          context,
                                                          listen: false)
                                                      .removeItem(index);
                                                },
                                                icon:
                                                    Icon(Icons.delete_forever)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: itemsStore.itemsCart.length,
                      ),
                    )
                  ],
                );
              }),
            );
          } else {
            return Container();
          }
        },
        future: service.getStore(),
      ),
    );
  }
}
