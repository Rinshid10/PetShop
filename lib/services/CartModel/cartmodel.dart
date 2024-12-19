import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petshop/model/CartModel/cartmodel.dart';

class CartServises {
  Dio dio = Dio();
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future addToCart(String? id) async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/$id/cart';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    log(id.toString());
    try {
      final response =
          await dio.post(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        log('Item added to cart');
      } else {
        log('Failed to add item to cart');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.statusCode}-${e.response?.data}');
      } else {
        log(e.toString());
      }
    }
  }

  Future<List<Datas>> getCart() async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/:id/cart';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      final response =
          await dio.get(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((i) => Datas.fromJson(i)).toList();
      } else {
        throw Exception('Failed to fetch cart');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.statusMessage}');
      } else {
        log(e.toString());
      }
    }
    return [];
  }
}
