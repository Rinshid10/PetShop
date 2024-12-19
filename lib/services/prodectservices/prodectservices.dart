import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:petshop/model/prodectsModel/prodects.dart';

class ProdectServices {
  final baseUrl = 'https://node-project-amber.vercel.app/products/';

  Dio dio = Dio();

  Future<List<Data>> getAllProdects() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((i) => Data.fromJson(i)).toList();
      } else {
        throw Exception('data is not fething ${response.data['status']}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
