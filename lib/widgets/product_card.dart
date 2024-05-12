import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/main.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({required this.product, super.key});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.updateProductScreen,
          arguments: product
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
              surfaceTintColor: Colors.white,
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 40),
                    Text(product.title,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(r'$' '${product.price}'),
                        Spacer(),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
            top: -40,
            right: 10,
            child: Image.network(product.image, width: 100, height: 100),
          ),
        ],
      ),
    );
  }
}
