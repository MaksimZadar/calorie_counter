import 'package:calorie_counter/views/add_food/product_loaded.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/product_scan_service.dart';

class AddFood extends StatelessWidget {
  AddFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductScanService c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
      ),
      body: Obx(
        () => c.currentProduct.value.barcode != null &&
                c.currentProduct.value.barcode != "NOT FOUND"
            ? const ProductLoaded()
            : c.currentProduct.value.barcode == "NOT FOUND"
                ? const Center(child: Text("Product Not Found"))
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
