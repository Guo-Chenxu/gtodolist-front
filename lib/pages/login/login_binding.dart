import 'package:get/get.dart';
import 'package:gtodolist/common/service/user_service.dart';
import 'package:gtodolist/pages/login/login_controller.dart';
import 'package:logger/logger.dart';

class LoginBinding implements Bindings {
  static final Logger _logger = Logger();

  @override
  void dependencies() {
    _logger.i('依赖注入');
    Get.lazyPut(() => UserService());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
