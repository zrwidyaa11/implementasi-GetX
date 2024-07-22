import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/third_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Example',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/detail', page: () => DetailPage()),
        GetPage(name: '/third', page: () => ThirdPage()),
      ],
      // Tambahkan theme untuk memperbaiki tampilan
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}