import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/task_data.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/services/data_base_services.dart';
import 'package:task_app/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  getTasks() async {
    tasks = await DatabaseServices.getTasks();
    Provider.of<TaskData>(context, listen: false).tasks = tasks;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<TaskData>(
          builder: (context, value, child) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskTile(
                      task: tasks[index],
                      taskData: value,
                    ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => AddTaskScreen());
          }),
    );
  }
}
