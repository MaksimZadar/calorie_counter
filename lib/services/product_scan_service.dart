import 'package:get/state_manager.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductScanService extends GetxController {
  String? barcode;
  Rx<Product> currentProduct = Product().obs;

  void getProduct(String barcode) async {
    // barcode = '5900343005296'; // for testing
    currentProduct = Product().obs;
    await _getProduct(barcode);
  }

  void calculateFoodEnergy(double servings, double grams) {}

  Future<void> _getProduct(String? barcode) async {
    if (barcode == null) return;
    ProductQueryConfiguration configuration = ProductQueryConfiguration(barcode,
        language: OpenFoodFactsLanguage.ENGLISH, fields: [ProductField.ALL]);
    ProductResult result = await OpenFoodAPIClient.getProduct(configuration);

    if (result.status == 1 && result.product != null) {
      currentProduct(result.product);
    } else {
      currentProduct(Product(barcode: "NOT FOUND"));
    }
  }
}
