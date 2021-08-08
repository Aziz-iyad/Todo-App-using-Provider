import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/models/task_model.dart';
import 'package:todo_app_using_provider/providers/MyProvider.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isComplete = false;

  String taskName;

  saveTask() {
    Provider.of<MyProvider>(context, listen: false)
        .insertTask(TaskModel(taskName: taskName, isComplete: isComplete));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                onChanged: (v) {
                  this.taskName = v;
                },
                decoration: InputDecoration(
                    labelText: 'Task Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
            Checkbox(
                value: isComplete,
                onChanged: (v) {
                  this.isComplete = v;
                  setState(() {});
                }),
            RaisedButton(
                child: Text('Insert New Task'),
                onPressed: () {
                  saveTask();
                })
          ],
        ),
      ),
    );
  }
}
