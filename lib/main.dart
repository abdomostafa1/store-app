import 'package:flutter/material.dart';
import 'package:store_app/network/add_product_service.dart';

void main() {
  AddProductService().addProduct()
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
