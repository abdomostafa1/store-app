import 'dart:convert';

import 'package:http/http.dart' as http;

class AllCategoriesService {
  Future<List<String>> getAllCategories() async {
    http.Response response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    if (response.statusCode == 200) {
      List<String> data = jsonDecode(response.body) as List<String>;
      return data;
    } else {
      throw Exception('status code =${response.statusCode}');
    }
  }
}
