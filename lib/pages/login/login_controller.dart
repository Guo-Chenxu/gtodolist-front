import 'package:get/get.dart';
import 'package:gtodolist/common/constants/constants.dart';
import 'package:gtodolist/common/http/http_code.dart';
import 'package:gtodolist/common/models/common_resp.dart';
import 'package:gtodolist/common/models/user_model.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:gtodolist/common/service/user_service.dart';
import 'package:logger/logger.dart';
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  final UserService _userService = Get.find<UserService>();

  static final Logger _logger = Logger();

  final _isObscure = true.obs;

  set isObscure(val) => _isObscure.value = val;
  get isObscure => _isObscure.value;

  changeObscure() => _isObscure.value = !_isObscure.value;

  String _username = "";
  String _password = "";

  onUsernameChanged(String username) {
    _username = username.trim();
  }

  onPasswordChanged(String password) {
    _password = password.trim();
  }

  login() async {
    if (_username.isEmpty) {
      Get.snackbar('用户名不能为空', '请输入用户名');
      return;
    }
    if (_password.isEmpty) {
      Get.snackbar('密码不能为空', '请输入密码');
      return;
    }

    CommonResp? commonResp = await _userService.login(_username, _password);
    if (commonResp == null || commonResp.status != HttpCode.success) {
      Get.snackbar('出现错误', commonResp?.message ?? Constants.defaultError);
      return;
    }

    LoginResp? loginResp = LoginResp.fromJson(commonResp.data);
    _logger.i("登录成功");
    SpUtil.putString(Constants.authorization, loginResp.token!);
    SpUtil.putObject(Constants.user, loginResp.user!);
    // Get.toNamed(AppRoutes.task + AppRoutes.taskList);
    Get.snackbar('登录成功', '欢迎回来');
    _logger.i("登录 token: ${SpUtil.getString(Constants.authorization)}");

    Get.toNamed(AppRoutes.task);
  }
}
