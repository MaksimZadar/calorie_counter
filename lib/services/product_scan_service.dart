import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/state_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductScanService extends GetxController {
  String? barcode;
  var currentProduct = Product().obs;

  Future<void> getProduct() async {
    // barcode = await scanBarcodeNormal();
    barcode = '9400581051339'; // for testing
    currentProduct = Product().obs;
    await _getProduct(barcode!);
  }

  Future<String> scanBarcodeNormal() async {
    return await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      false,
      ScanMode.BARCODE,
    );
  }

  Future<void> _getProduct(String barcode) async {
    ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode,
        language: OpenFoodFactsLanguage.ENGLISH, fields: [ProductField.ALL]);
    ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

    if (result.status == 1 && result.product != null) {
      currentProduct.value = result.product!;
    } else {
      throw Exception('product not found, please insert data for ' + barcode);
    }
  }
}
