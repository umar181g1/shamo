import 'package:flutter/material.dart';

import '../models/product_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<ProductModel> _fav = [];

  List<ProductModel> get fav => _fav;

  set fav(List<ProductModel> fav) {
    _fav = fav;
    notifyListeners();
  }

  setProduct(ProductModel productModel) {
    if (!isFav(productModel)) {
      _fav.add(productModel);
    } else {
      _fav.removeWhere((element) => element.id == productModel.id);
    }

    notifyListeners();
  }

  isFav(ProductModel productModel) {
    if (_fav.indexWhere((element) => element.id == productModel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
