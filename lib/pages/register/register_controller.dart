import 'package:get/get.dart';
import 'package:gtodolist/common/constants/constants.dart';
import 'package:gtodolist/common/http/http_code.dart';
import 'package:gtodolist/common/models/common_resp.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:gtodolist/common/service/user_service.dart';

class RegisterController extends GetxController {
  final UserService _userService = Get.find<UserService>();

  final _isObscure = true.obs;

  set isObscure(val) => _isObscure.value = val;
  get isObscure => _isObscure.value;

  changeObscure() => _isObscure.value = !_isObscure.value;

  String _username = "";
  String _password = "";

  void onUsernameChanged(String username) {
    _username = username.trim();
  }

  void onPasswordChanged(String password) {
    _password = password.trim();
  }

  void register() async {
    if (_username.isEmpty) {
      Get.snackbar('用户名不能为空', '请输入用户名');
      return;
    }
    if (_password.isEmpty) {
      Get.snackbar('密码不能为空', '请输入密码');
      return;
    }

    CommonResp? commonResp = await _userService.register(_username, _password);
    if (commonResp == null || commonResp.status != HttpCode.success) {
      Get.snackbar('出现错误', commonResp?.message ?? Constants.defaultError);
      return;
    }

    Get.snackbar('注册成功', '快去登录吧');
    const String route = AppRoutes.user + AppRoutes.login;
    Get.toNamed(route);
  }
}
