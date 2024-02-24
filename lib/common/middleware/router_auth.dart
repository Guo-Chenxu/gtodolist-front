import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/constants/constants.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:sp_util/sp_util.dart';

class RouteAuthMiddleware extends GetMiddleware {
  // @override
  // int? priority = 0;

  // RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    String? token = SpUtil.getString(Constants.authorization);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (token == null || token.isEmpty) {
          Get.snackbar('未登录', '请先登录再访问该页面');
        }
      },
    );
    if (token == null || token.isEmpty) {
      return const RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}
