import 'package:commerce_flutter/data/models/items_model.dart';
import 'package:commerce_flutter/data/models/store_model.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([StoreService])
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

  Future<List<StoreModel>> getElectronics() async {
    const urlElec = 'https://fakestoreapi.com/products/category/electronics';
    try {
      final response = await dio.get(urlElec);
      final dataElec = List<StoreModel>.from(
          response.data.map((e) => StoreModel.fromJson(e))).toList();
      return dataElec;
    } catch (e) {
      throw Exception('Erro ao pegar dados');
    }
  }

  Future<List<StoreModel>> getJawelery() async {
    const urlJawe = 'https://fakestoreapi.com/products/category/jewelery';
    try {
      final response = await dio.get(urlJawe);
      final dataJawelery = List<StoreModel>.from(
          response.data.map((e) => StoreModel.fromJson(e))).toList();
      return dataJawelery;
    } catch (e) {
      throw Exception('Erro ao pegar dados');
    }
  }
}
