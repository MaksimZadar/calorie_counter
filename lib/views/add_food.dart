import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/product_scan_service.dart';

class AddFood extends StatelessWidget {
  AddFood({Key? key}) : super(key: key);

  final ProductScanService productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Obx(
          () => Text(productController.currentProduct.value.productName ??
              "Searching..."),
        ),
      ),
    );
  }
}
