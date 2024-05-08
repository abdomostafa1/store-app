import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class GetCategoryService {

  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    http.Response response = await http.get(
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));
    if(response.statusCode == 200) {
      List<dynamic>data = jsonDecode(response.body);
      List<ProductModel> productsList = [];
      for (var item in data) {
        productsList.add(ProductModel.fromJson(item));
      }

      return productsList;
    }
    else {
      throw Exception('status code =${response.statusCode}');
    }
  }
}
