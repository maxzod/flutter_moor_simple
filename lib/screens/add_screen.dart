import 'package:flutter/material.dart';
import 'package:tasker/db/tasks_dao.dart';
import 'package:tasker/db/tasks_database.dart';

class AddScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AddScreen> {
  String taskText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'task name'),
            onChanged: (val) {
              taskText = val;
            },
          )
        ],
      )),
      appBar: AppBar(title: Text('Add Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dao = TaskDao(AppDatabase());
         await dao.insertTask(Task(name: taskText));
         Navigator.pop(context);
         },
        child: Icon(Icons.check),
      ),
    );
  }
}
