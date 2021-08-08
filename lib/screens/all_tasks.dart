import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/myWidgets/task_widget.dart';
import 'package:todo_app_using_provider/providers/MyProvider.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<MyProvider>(context).allTasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
            Provider.of<MyProvider>(context).allTasks[index],
          );
        });
  }
}
