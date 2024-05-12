import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/network/all_products_service.dart';
import 'package:store_app/widgets/product_card.dart';

import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('New Brand', style: TextStyle(color: Colors.black)),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(FontAwesomeIcons.cartPlus))
            ]),
        body: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 40),
                  child: GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index],);
                      }),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('error'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
