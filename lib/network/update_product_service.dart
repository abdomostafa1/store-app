import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    final response = await http.put(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception('there is an error');
    }
  }
}
