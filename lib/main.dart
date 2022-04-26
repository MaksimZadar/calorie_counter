import 'package:calorie_counter/services/page_service.dart';
import 'package:calorie_counter/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final PageService pageController = Get.put(PageService());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CalorieOne',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("CalorieOne"), actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.add)),
        ]),
        body: Obx(() => pageController.getPage()),
        floatingActionButton: null,
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
