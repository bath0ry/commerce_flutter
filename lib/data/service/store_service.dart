import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:dio/dio.dart';

class StoreService {
  final Dio dio;

  StoreService(this.dio);

  Future<List<StoreModel>> getStore() async {
    const url = 'https://fakestoreapi.com/products';

    try {
      final response = await dio.get(url);
      final data = List<StoreModel>.from(
          response.data.map((e) => StoreModel.fromJson(e))).toList();
      return data;
    } catch (e) {
      throw Exception('Erro ao pegar dados');
    }
  }
}
