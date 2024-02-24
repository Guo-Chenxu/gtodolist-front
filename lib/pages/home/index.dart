import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gtodolist/common/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("首页"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width / 4,
                      MediaQuery.of(context).size.width / 20)),
              onPressed: () =>
                  Get.toNamed('${AppRoutes.user}${AppRoutes.login}'),
              child: const Text(
                '登录',
                selectionColor: Colors.black,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width / 4,
                      MediaQuery.of(context).size.width / 20)),
              onPressed: () => Get.toNamed(AppRoutes.user + AppRoutes.register),
              child: const Text('注册'),
            ),
          ],
        ),
      ),
    );
  }
}
