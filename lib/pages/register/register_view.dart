import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gtodolist/pages/register/component/register_body.dart';
import 'package:gtodolist/pages/register/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (controller) => const Scaffold(
              body: RegisterBody(),
            ));
  }
}
