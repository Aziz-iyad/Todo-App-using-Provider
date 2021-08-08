import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/models/task_model.dart';
import 'package:todo_app_using_provider/providers/MyProvider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;

  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: taskModel.isComplete ? Colors.lightGreen : Colors.redAccent),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
              value: taskModel.isComplete,
              onChanged: (v) {
                taskModel.isComplete = v;
                Provider.of<MyProvider>(context, listen: false)
                    .updateTask(taskModel);
              }),
          SizedBox(
            width: 10,
          ),
          Text(taskModel.taskName),
          Spacer(),
          IconButton(
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false)
                    .deleteTask(taskModel);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
