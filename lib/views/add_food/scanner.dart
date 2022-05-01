import 'package:calorie_counter/services/product_scan_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'add_food.dart';

class BarcodeScannerWithoutController extends StatefulWidget {
  const BarcodeScannerWithoutController({Key? key}) : super(key: key);

  @override
  _BarcodeScannerWithoutControllerState createState() =>
      _BarcodeScannerWithoutControllerState();
}

class _BarcodeScannerWithoutControllerState
    extends State<BarcodeScannerWithoutController>
    with SingleTickerProviderStateMixin {
  String? barcode;

  @override
  Widget build(BuildContext context) {
    final ProductScanService c = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: MobileScanner(
        allowDuplicates: false,
        fit: BoxFit.contain,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) return;
          c.getProduct(barcode.rawValue!);
          Get.off(() => AddFood());
        },
      ),
    );
  }
}
