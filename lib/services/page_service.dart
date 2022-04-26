import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class PageService extends GetxController {
  RxInt pageIndex = 0.obs;

  void setPage(int newIndex) {
    pageIndex.value = newIndex;
  }

  int getIndex() => pageIndex.value;

  Widget getPage() {
    switch (pageIndex.value) {
      case 1:
        return const Center(child: Text("SAVED"));
      case 2:
        return const Center(child: Text("SETTINGS"));
      case 0:
      default:
        return const Center(child: Text("HOME"));
    }
  }
}
