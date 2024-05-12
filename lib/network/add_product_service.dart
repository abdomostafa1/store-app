import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct() async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: {
        'title': 'test product',
        'price': '13.5',
        'description': 'lorem ipsum set',
        'image': 'https://i.pravatar.cc',
        'category': 'electronic'
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
