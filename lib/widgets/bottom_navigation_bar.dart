import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/page_service.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  final PageService pageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: "Settings",
          ),
        ],
        onTap: pageController.setPage,
        currentIndex: pageController.getIndex(),
        selectedLabelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
