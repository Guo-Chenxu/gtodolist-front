import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:gtodolist/pages/login/login_controller.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("登录页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 用户名
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                autofocus: true,
                onChanged: (value) => controller.onUsernameChanged(value),
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // 密码
            GetX<LoginController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextField(
                    autocorrect: false,
                    obscureText: _.isObscure,
                    autofocus: true,
                    onChanged: (value) => controller.onPasswordChanged(value),
                    decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _.changeObscure();
                        },
                        icon: Obx(() {
                          return Icon(_.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility);
                        }),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('登录'),
                  onPressed: () => {controller.login()},
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  child: const Text('没有账号, 去注册'),
                  onPressed: () =>
                      Get.toNamed(AppRoutes.user + AppRoutes.register),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
