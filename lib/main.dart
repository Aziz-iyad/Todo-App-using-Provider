import 'package:flutter/material.dart';
import 'package:todo_app_using_provider/helpers/db_helper.dart';
import 'package:todo_app_using_provider/providers/MyProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/screens/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      )));
}
