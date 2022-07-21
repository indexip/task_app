import 'package:flutter/cupertino.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/data_base_services.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  void addTasks(String title) async {
    Task task = await DatabaseServices.addTasks(title);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.getToggle();
    DatabaseServices.updateTask(task.id);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    DatabaseServices.deleteTask(task.id);
    notifyListeners();
  }
}
