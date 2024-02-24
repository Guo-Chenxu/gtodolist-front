import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/config/global_config.dart';
import 'package:gtodolist/common/routes/app_pages.dart';

Future<void> main() async {
  await GlobalConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GTODOLIST',
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
