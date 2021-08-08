import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/providers/MyProvider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text(Provider.of<MyProvider>(context).message)),
            ElevatedButton(
              child: Text('change provider value'),
              onPressed: () {
                print(Provider.of<MyProvider>(context, listen: false)
                    .changeName('mo'));
              },
            ),
          ],
        ));
  }
}
