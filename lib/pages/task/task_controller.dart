import 'package:get/get.dart';
import 'package:gtodolist/common/http/http_code.dart';
import 'package:gtodolist/common/models/common_resp.dart';
import 'package:gtodolist/common/models/task_model.dart';
import 'package:gtodolist/common/service/task_service.dart';
import 'package:logger/logger.dart';

class TaskController extends GetxController {
  final TaskService _taskService = Get.find<TaskService>();

  static final Logger _logger = Logger();

  final _total = 0.obs;
  final RxList<Task> _tasks = List<Task>.from([]).obs;

  set total(val) => _total.value = val;
  int get total => _total.value;

  set tasks(val) => _tasks.value = val;
  List<Task> get tasks => _tasks;

  bool validate(String title, String content) {
    if (title.isEmpty) {
      Get.snackbar('任务标题不能为空', '');
      return false;
    }

    if (content.isEmpty) {
      Get.snackbar('任务内容不能为空', '');
      return false;
    }

    return true;
  }

  Future<bool> create(String title, String content) async {
    _logger.i("创建任务: \n title=$title \n content=$content");

    CommonResp? commonResp = await _taskService.create(title, content);
    if (commonResp == null || commonResp.status != HttpCode.success) {
      _logger.e('创建任务失败, ${commonResp?.message ?? '未知原因'}');
      return false;
    }

    Get.snackbar('创建任务成功', '');
    await list();
    return true;
  }

  Future<bool> updateTask(int id, String title, String content) async {
    _logger.i("修改任务: \n id=$id \n title=$title \n content=$content");

    CommonResp? commonResp = await _taskService.update(id, title, content);
    if (commonResp == null || commonResp.status != HttpCode.success) {
      _logger.e('更新任务失败, ${commonResp?.message ?? '未知原因'}');
      return false;
    }

    Get.snackbar('更新任务成功', '');
    await list();
    return true;
  }

  list() async {
    CommonResp? commonResp = await _taskService.list();
    try {
      _logger.i("commonResp: $commonResp");
      if (commonResp == null || commonResp.status != HttpCode.success) {
        _logger.e('获取任务列表失败, ${commonResp?.message ?? '未知原因'}');
        Get.snackbar('获取任务列表失败', commonResp?.message ?? '网络异常');
        return;
      }

      _logger.i(commonResp.data);
      TaskListResp listResp = TaskListResp.fromJson(commonResp.data);
      _total.value = listResp.total ?? 0;
      _tasks.value = listResp.item ?? [];
    } catch (e) {
      _logger.e('获取任务列表失败, $e');
    }
  }

  Future<bool> delete(int id) async {
    CommonResp? commonResp = await _taskService.delete(id);
    if (commonResp == null || commonResp.status != HttpCode.success) {
      _logger.e('删除任务失败, ${commonResp?.message ?? '未知原因'}');
      Get.snackbar('删除任务失败', commonResp?.message ?? '网络异常');
      return false;
    }

    Get.snackbar('删除成功', '');
    _tasks.removeWhere((element) => element.id == id);
    return true;
  }
}
