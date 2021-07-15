import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/app/modules/home/view/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Edit Image',
      home: HomePage(),
    );
  }
}