import 'dart:async';

import '../models/product.dart';
import '../services/product_http_services.dart';


class ProductsController {
  final productHttpServices = ProductHttpServices();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productHttpServices.getProduct();
    return products;
  }
}
