import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/models/task_model.dart';
import 'package:gtodolist/common/routes/app_pages.dart';
import 'package:gtodolist/pages/task/component/task_dialog.dart';
import 'package:gtodolist/pages/task/task_controller.dart';

class TaskBody extends GetView<TaskController> {
  TaskBody({super.key});

  final TaskDialog _taskDialog = Get.find<TaskDialog>();

  Widget _buildItem(BuildContext context, int index) {
    Task task = controller.tasks[index];
    return Column(
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Text(task.title!),
                const SizedBox(width: 20),
                Text(task.createAt!),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    _taskDialog.showUpdateDialog(context, task);
                  },
                  child: const Text(
                    '修改',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    _taskDialog.showDeleteDialog(context, task);
                  },
                  child: const Text(
                    '删除',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            )
          ],
        ),
        ListTile(
          onTap: () => _taskDialog.showDetailDialog(context, task),
          title: Text(task.content!),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("任务页面"),
      ),
      body: GetX<TaskController>(
          init: controller,
          initState: (_) async {
            await controller.list();
          },
          builder: (_) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.offAllNamed(AppRoutes.home),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 242, 180, 94),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        '返回主页',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () => {
                            Get.snackbar('别按啦, 再按待办也不会减少哒',
                                '目前一共有 ${_.tasks.length} 条待办任务')
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 110, 180, 236),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            '目前一共有 ${_.tasks.length} 条待办任务',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () =>
                              _taskDialog.showCreateDialog(context),
                          child: const Text("新增任务"),
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: _.tasks.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildItem(context, index),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          }),
    );
  }
}
