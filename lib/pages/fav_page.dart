import 'package:commerce_flutter/data/models/favorite_items_model.dart';
import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:commerce_flutter/data/service/store_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late final StoreService service;

  void initState() {
    service = StoreService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Consumer<FavItems>(builder:
                  (BuildContext context, FavItems favItems, Widget? widget) {
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
                                      favItems.favItems[index].image,
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
                                            favItems.favItems[index].title,
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
                                                  Provider.of<FavItems>(context,
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
                        childCount: favItems.favItems.length,
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
