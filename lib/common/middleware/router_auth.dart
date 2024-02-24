import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/constants/constants.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:gtodolist/common/service/user_service.dart';
import 'package:logger/logger.dart';
import 'package:sp_util/sp_util.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  final Logger _logger = Logger();

  static final List<String> _skipRoutes = [
    AppRoutes.home,
    AppRoutes.home,
    AppRoutes.register
  ];

  @override
  RouteSettings? redirect(String? route) {
    _logger.i('Auth route: $route');
    String? token = SpUtil.getString(Constants.authorization) ?? '';

    if (!_skipRoutes.contains(route) && token.isEmpty) {
      Future.delayed(
          const Duration(seconds: 1), () => Get.snackbar('未登录', '请先登录再访问该页面'));
      return const RouteSettings(name: AppRoutes.home);
    }

    return super.redirect(route);
  }
}
