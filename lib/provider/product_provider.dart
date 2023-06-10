import 'package:flutter/material.dart';
import 'package:product/model/product_model.dart';
import 'package:product/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final _service = ProductService();
  List<ProductModel> _product = [];

  List<ProductModel> get product => _product;
  bool isLoading = false;

  Future<void> getAllProduct() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getProductData();
    _product = response;
    isLoading = false;
    notifyListeners();
  }
}
