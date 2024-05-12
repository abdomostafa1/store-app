import 'dart:convert';

import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic>data = jsonDecode(response.body);
      List<ProductModel> productsList = [];
      for (var i =0;i<4;i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }

      return productsList;
    }
    else {
      throw Exception('status code =${response.statusCode}');
    }
  }
}