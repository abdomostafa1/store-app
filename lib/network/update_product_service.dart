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
    final body = {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    };
    final url ='https://fakestoreapi.com/products/$id';
    print('body=$body  & url=$url');
    final response = await http.put(
      Uri.parse(url),
      body:body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print('data=$data');
      return ProductModel.fromJson(data);
    } else {
      throw Exception('there is an error');
    }
  }
}
