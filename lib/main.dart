import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      onInit: () async {
        await SpUtil.getInstance();
      },
    );
  }
}
