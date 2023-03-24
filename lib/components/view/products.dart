import 'package:commerce_flutter/components/view/products_list.dart';
import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/service/store_service.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('erro'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<StoreModel> data = snapshot.data as List<StoreModel>;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ProductsList(data: data),
          );
        } else {
          return Container();
        }
      },
      future: service.getStore(),
    );
  }
}
