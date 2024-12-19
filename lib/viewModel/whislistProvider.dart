// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:petshop/model/WishlistModel/wihsliitmodel.dart';
// import 'package:petshop/services/wishlistsSer/wishlists.dart';

// class Whislistprovider extends ChangeNotifier {
//   List<WishlistData> getAllDataInWhislist = [];
//   WishlistServices ser = WishlistServices();
//   bool isloding = false;

//   Future adddToWhislist(String? id) async {
//     await ser.addtoWhisList(id);
//     notifyListeners();
//   }

//   Future DeleteToWhislist(String? id, index) async {
//     await ser.deleteWhisList(id);
//     getAllDataInWhislist.removeAt(index);
//     notifyListeners();
//   }

//   Future getALlWhis() async {
//     isloding = true;
//     notifyListeners();
//     try {
//       getAllDataInWhislist = await ser.getallData();
//       log(getAllDataInWhislist.toString());
//       log("succes to get inlist");
//     } catch (e) {
//       log("$e");
//     } finally {
//       isloding = false;
//       notifyListeners();
//     }
//   }
// }
