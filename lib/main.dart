import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'provider/assist_provider_impl.dart';
import 'service/assist_service.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  Get.lazyPut(() => AssistService(assistProvider: AssistProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ABC Tech',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme:
            const TextTheme(headlineMedium: TextStyle(color: Colors.yellow))
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage(), binding: HomeBind())
      ]
    );
  }
}

