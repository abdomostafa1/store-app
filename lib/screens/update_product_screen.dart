import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/network/update_product_service.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }

                  setState(() {
                    isLoading = false;
                  });
                },
                child: Text('update', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  backgroundColor: Colors.blue,
                ),
              )
            ]),
          )),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      desc: desc ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
