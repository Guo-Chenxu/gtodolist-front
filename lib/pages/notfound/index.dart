import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gtodolist/common/routes/app_pages.dart';

class NotfoundView extends StatelessWidget {
  const NotfoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('返回主页'),
              onPressed: () => Get.toNamed(AppRoutes.home),
            )
          ],
        ),
      ),
    );
  }
}
