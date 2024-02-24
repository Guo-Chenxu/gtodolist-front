import 'package:get/get.dart';
import 'package:gtodolist/common/middleware/router_auth.dart';
import 'package:gtodolist/pages/home/index.dart';
import 'package:gtodolist/pages/login/login_binding.dart';
import 'package:gtodolist/pages/login/login_view.dart';
import 'package:gtodolist/pages/notfound/index.dart';
import 'package:gtodolist/pages/register/register_binding.dart';
import 'package:gtodolist/pages/register/register_view.dart';
import 'package:gtodolist/pages/task/task_binding.dart';
import 'package:gtodolist/pages/task/task_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.notfound, page: () => const NotfoundView()),
    GetPage(name: AppRoutes.user, page: () => const NotfoundView(), children: [
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: AppRoutes.register,
        page: () => const RegisterView(),
        binding: RegisterBinding(),
      )
    ]),
    GetPage(
      name: AppRoutes.task,
      page: () => const TaskListView(),
      binding: TaskBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 0),
      ],
    )
  ];
}
