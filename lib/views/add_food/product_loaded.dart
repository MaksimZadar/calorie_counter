import 'package:calorie_counter/services/product_scan_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openfoodfacts/model/Product.dart';

const List<String> measurementType = [
  "Servings",
  "Grams",
];

class ProductLoaded extends StatefulWidget {
  const ProductLoaded({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductLoaded> createState() => _ProductLoadedState();
}

class _ProductLoadedState extends State<ProductLoaded> {
  final _formKey = GlobalKey<_ProductLoadedState>();

  @override
  Widget build(BuildContext context) {
    final ProductScanService c = Get.find();

    return Form(
      key: _formKey,
      child: Obx(
        () {
          var product = c.currentProduct;
          return ListView(
            children: [
              ListTile(
                title: Text(product.value.productName ?? ""),
              ),
              const Divider(height: 0),
              const ListTile(
                title: ServingsRow(),
              ),
              const Divider(height: 0),
              ListTile(
                title: ServingSizeRow(product: product.value),
              ),
              const Divider(height: 0),
            ],
          );
        },
      ),
    );
  }
}

class ServingSizeRow extends StatelessWidget {
  ServingSizeRow({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  final ProductScanService p = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Of"),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(filled: true),
            value: product.servingSize ?? "100g",
            items: [
              DropdownMenuItem(
                value: product.servingSize ?? "100g",
                child: Text(product.servingSize ?? "100g"),
              ),
              const DropdownMenuItem(
                value: "250g",
                child: Text("250g"),
              ),
              const DropdownMenuItem(
                value: "1g",
                child: Text("1g"),
              ),
              const DropdownMenuItem(
                value: "0.1g",
                child: Text("0.1g"),
              ),
            ],
            onChanged: (val) {
              if (val == product.servingSize) {
                // p.calculateFoodEnergy(servings, grams)
              } else {}
            },
          ),
        ),
      ],
    );
  }
}

class ServingsRow extends StatelessWidget {
  const ServingsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Servings",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: TextFormField(
            initialValue: "1",
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
            ),
          ),
        )
      ],
    );
  }
}
