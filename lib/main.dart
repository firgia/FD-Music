import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/app/config/routes/app_pages.dart';
import 'package:music_app/app/config/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: AppTheme.basic,
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}
