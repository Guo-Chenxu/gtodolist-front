import 'package:get/get.dart';
import 'package:gtodolist/common/service/task_service.dart';
import 'package:gtodolist/pages/task/component/task_dialog.dart';
import 'package:gtodolist/pages/task/task_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskService());
    Get.lazyPut(() => TaskDialog());
    Get.lazyPut<TaskController>(() => TaskController());
  }
}
