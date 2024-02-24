import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtodolist/pages/task/component/task_body.dart';
import 'package:gtodolist/pages/task/task_controller.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        builder: (controller) => Scaffold(
              body: (TaskBody()),
            ));
  }
}
