import 'package:flutter/material.dart';
import 'package:todo_app_using_provider/helpers/db_helper.dart';
import 'package:todo_app_using_provider/models/task_model.dart';

class MyProvider extends ChangeNotifier {
  MyProvider() {
    getAllTasks();
  }
  List<TaskModel> allTasks;
  List<TaskModel> completeTasks;
  List<TaskModel> inCompleteTasks;

  getAllTasks() async {
    this.allTasks = await DbHelper.dbHelper.getAllTasks();
    this.completeTasks =
        this.allTasks.where((element) => element.isComplete).toList();
    this.inCompleteTasks =
        this.allTasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.createNewTask(taskModel);
    getAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.updateTask(taskModel);
    getAllTasks();
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteTask(taskModel);
    getAllTasks();
  }

  String message = 'aziz';
  changeName(String newName) {
    this.message = newName;
    notifyListeners();
  }
}
