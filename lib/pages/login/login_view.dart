import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gtodolist/pages/login/component/login_body.dart';
import 'package:gtodolist/pages/login/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => const Scaffold(
              body: LoginBody(),
            ));
  }
}
