import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductHttpServices {
  Future<List<Product>> getProduct() async {
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/products');

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Product> loadedProducts = [];

    if (data != null) {
      for (var element in data) {
        loadedProducts.add(Product.fromJson(element));
      }
    }

    return loadedProducts;
  }
}
