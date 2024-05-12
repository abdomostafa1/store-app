import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/network/update_product_service.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatelessWidget {
  UpdateProductScreen({super.key});

  String? productName, desc, image,price;

  @override
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
        appBar: AppBar(
          title: const Text('update product'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(children: [
            CustomTextField(
                hint: 'product name',
                onChange: (value) {
                  productName = value;
                }),
            CustomTextField(
                hint: 'description',
                onChange: (value) {
                  desc = value;
                }),
            CustomTextField(
                hint: 'price',
                keyboardType: TextInputType.number,
                onChange: (value) {
                  price = value;
                }),
            CustomTextField(
                hint: 'image',
                onChange: (value) {
                  image = value;
                }),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await UpdateProductService().updateProduct(
                  id: product.id,
                  title: productName?? product.title,
                  price: price ?? product.price.toString(),
                  desc: desc ?? product.description,
                  image: image ?? product.image,
                  category: product.category,
                );
              },
              child: Text('update', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                backgroundColor: Colors.blue,
              ),
            )
          ]),
        ));
  }
}
