import 'package:flutter/material.dart';
import 'package:shamo/Api/api_service.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _product = [];

  List<ProductModel> get products => _product;

  set product(List<ProductModel> products) {
    _product = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ApiService().getProduct();
      _product = products;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
