import 'dart:developer';

import 'package:http/http.dart' as http;

class AddProductService {
  void addProduct() async {
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
    log(response.body);
  }
}
