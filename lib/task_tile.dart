import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task, required this.taskData})
      : super(key: key);
  final Task task;
  final TaskData taskData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
            value: task.done,
            onChanged: (value) {
              taskData.updateTask(task);
            }),
        title: Text(
          task.title,
          style: TextStyle(
              decoration:
                  task.done ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: IconButton(
            onPressed: () {
              taskData.deleteTask(task);
            },
            icon: const Icon(Icons.close_sharp)),
      ),
    );
  }
}
