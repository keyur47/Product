import 'dart:convert';

import 'package:product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getProductData() async {
    const url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      return productModelFromJson(jsonEncode(json));
    }
    return [];
  }
}
