import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/common/models/task_model.dart';
import 'package:gtodolist/pages/task/task_controller.dart';
import 'package:logger/logger.dart';

class TaskDialog {
  final TaskController _controller = Get.find<TaskController>();

  final Logger _logger = Logger();

  void showCreateDialog(BuildContext context) {
    String title = "";
    String content = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('新增待办'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  onChanged: (value) => {title = value},
                  decoration: const InputDecoration(
                    labelText: '标题',
                    hintText: '请输入标题',
                    prefixIcon: Icon(Icons.title),
                  ),
                ),
                TextField(
                  autofocus: true,
                  onChanged: (value) => {content = value},
                  decoration: const InputDecoration(
                    labelText: '内容',
                    hintText: '请输入内容',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                child: const Text('保存'),
                onPressed: () {
                  if (_controller.validate(title, content)) {
                    _controller.create(title, content).then((value) {
                      _logger.i(value);
                      if (value) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                }),
            TextButton(
              child: const Text('取消'),
              onPressed: () => Get.back(),
            )
          ],
        );
      },
    );
  }

  void showUpdateDialog(BuildContext context, Task task) {
    String title = task.title!;
    String content = task.content!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('修改待办'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: TextEditingController(text: title),
                  onChanged: (value) => {title = value},
                  decoration: const InputDecoration(
                    labelText: '标题',
                    prefixIcon: Icon(Icons.title),
                  ),
                ),
                TextField(
                  autofocus: true,
                  controller: TextEditingController(text: content),
                  onChanged: (value) => {content = value},
                  decoration: const InputDecoration(
                    labelText: '内容',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                child: const Text('保存'),
                onPressed: () {
                  if (_controller.validate(title, content)) {
                    _controller
                        .updateTask(task.id!, title, content)
                        .then((value) {
                      if (value) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                }),
            TextButton(
              child: const Text('取消'),
              onPressed: () => Get.back(),
            )
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('是否确认删除该条代办'),
          content: Text('待办信息: ${task.title}  ${task.createAt}'),
          actions: [
            TextButton(
                child: const Text('确认'),
                onPressed: () {
                  _controller.delete(task.id!).then((value) {
                    if (value) {
                      Navigator.of(context).pop();
                    }
                  });
                }),
            TextButton(
              child: const Text('取消'),
              onPressed: () => Get.back(),
            )
          ],
        );
      },
    );
  }

  void showDetailDialog(BuildContext context, Task task) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('待办详情'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('待办标题: ${task.title}'),
                  const Divider(),
                  Text('待办创建时间: ${task.createAt}'),
                  const Divider(),
                  Text('待办内容: ${task.content}'),
                ],
              ),
            ),
          );
        });
  }
}
