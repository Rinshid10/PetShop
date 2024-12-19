import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petshop/model/prodectsModel/prodects.dart';
import 'package:petshop/services/prodectservices/prodectservices.dart';

class ProviderprodectsForFetch extends ChangeNotifier {
  bool isloding = false;
  List<Data> getAllProdectsInList = [];
  ProdectServices prs = ProdectServices();

  Future getdatass() async {
    isloding = true;
    notifyListeners();
    try {
      getAllProdectsInList = await prs.getAllProdects();
      if (getAllProdectsInList.isEmpty) {
        log('List is emptyy');
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isloding = false;
      notifyListeners();
    }
  }
}
