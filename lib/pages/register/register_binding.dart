import 'package:get/get.dart';
import 'package:gtodolist/common/service/user_service.dart';
import 'package:gtodolist/pages/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserService());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
