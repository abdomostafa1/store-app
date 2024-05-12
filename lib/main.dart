import 'package:flutter/material.dart';
import 'package:store_app/network/add_product_service.dart';
import 'package:store_app/network/update_product_service.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.homeScreen : (context) => HomeScreen(),
        Routes.updateProductScreen : (context) => UpdateProductScreen()
      },
      initialRoute: Routes.homeScreen
    );
  }
}

class Routes {
  static String homeScreen = 'HomeScreen';
  static String updateProductScreen = 'updateProductScreen';
}
