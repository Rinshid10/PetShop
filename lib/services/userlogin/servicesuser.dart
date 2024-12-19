import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petshop/model/loginModel/register.dart';

import 'package:petshop/model/registerModel/registermodel.dart';

class UserServices {
  final baseUrl = 'https://node-project-amber.vercel.app/';
  Dio dio = Dio();
  FlutterSecureStorage storage = FlutterSecureStorage();

  void regsterUserFnc(RegisterUser userdata) async {
    try {
      log('register user ${userdata.toJson()}');
      final response =
          await dio.post("${baseUrl}register", data: userdata.toJson());
      log('the data from response when the user enter ${response.data}\n and the states code for that ${response.statusCode} ');
      if (response.statusCode == 201) {
        log('${response.data["message"]}');
        log('${response.data["status"]}');
        final token = response.data['token'];
        log(token);
        await storage.write(key: 'auth_token', value: token);
      } else {
        log('Unexpected response status: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.statusCode}-${e.response?.data}');
      }
    }
  }

  Future<void> lognuser(LoginUser userdata) async {
    try {
      final respone =
          await dio.post("${baseUrl}login", data: userdata.toJson());
      log('The login users were they enterd ${userdata.toJson()}');
      if (respone.statusCode == 200) {
        log('${respone.data['message']}');
        final token = respone.data['token'];
        log(token);
        await storage.write(key: 'auth_token', value: token);
      } else {
        log('un exepteed eroor in login ${respone.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        log("${e.response?.data}");
      }
    }
  }
}
