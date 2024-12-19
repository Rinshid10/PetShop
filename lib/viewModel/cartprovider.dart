import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petshop/model/CartModel/cartmodel.dart';

import 'package:petshop/services/CartModel/cartmodel.dart';

class Cartprovider extends ChangeNotifier {
  List<Datas> cartList = [];
  bool isloadin = false;
  CartServises ser = CartServises();
  Future addToCartInprovider(String? id) async {
    ser.addToCart(id);
    notifyListeners();
  }

  Future getALlCart() async {
    isloadin = true;
    notifyListeners();
    try {
      cartList = await ser.getCart();
      log(cartList.toString());
      log("message");
    } catch (e) {
      log('error found to get in list $e');
    } finally {
      isloadin = false;
      notifyListeners();
    }
  }
}
