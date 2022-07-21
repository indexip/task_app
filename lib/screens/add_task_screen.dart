import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  String titleTask = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Agregar Tareas'),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              titleTask = value;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          TextButton(
            onPressed: () {
              if (titleTask.isNotEmpty) {
                Provider.of<TaskData>(context, listen: false)
                    .addTasks(titleTask);
                Navigator.pop(context);
              }
            },
            child: Text(
              'Guardar',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.blue),
          )
        ],
      ),
    );
  }
}
