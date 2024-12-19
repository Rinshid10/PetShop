import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petshop/model/WishlistModel/wihsliitmodel.dart';

class WishlistServices {
  FlutterSecureStorage storage = FlutterSecureStorage();
  Dio dio = Dio();

  addtoWhisList(String? id) async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/$id/wishlists';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      final response =
          await dio.post(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        log('Item added to whislist');
      } else {
        log('not added and failed');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.statusMessage}-${e.response?.data}');
      }
    }
  }

  Future<List<WishlistData>> getallData() async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/:id/wishlists';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      final response =
          await dio.get(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        log("sucess to get the data ");
        List<dynamic> data = response.data['data'];
        return data.map((i) => WishlistData.fromJson(i)).toList();
      } else {
        throw Exception('error to fecth items');
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

  deleteWhisList(String? id) async {
    final token = await storage.read(key: 'auth_token');
    final baseUrl = 'https://node-project-amber.vercel.app/$id/wishlists';
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    try {
      final response =
          await dio.delete(baseUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        log('Item added to whislist');
      } else {
        log('not added and failed');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.statusMessage}-${e.response?.data}');
      }
    }
  }
}
