import 'package:flutter/material.dart';
import 'package:tasker/db/tasks_dao.dart';
import 'package:tasker/db/tasks_database.dart';
import 'package:tasker/screens/add_screen.dart';
import 'package:tasker/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = 'click on fab';

  @override
  Widget build(BuildContext context) {
    final dao = TaskDao(AppDatabase());
    return Scaffold(
      body: Center(
          child: StreamBuilder<List<Task>>(
            stream: dao.watchAllTasks(),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Text('hasError');
              } else if (snapShot.hasData) {
                if(
                snapShot.data.length == 0
                ){
                  return Text('empty');
                }
                print(snapShot.data.length);
                return ListView.builder(
                    itemCount:  snapShot.data.length,
                    itemBuilder: (cont, index) {
                  return TaskItem(snapShot.data[index]);
                });
              }else{
                return CircularProgressIndicator();
              }
            },
          )),
      appBar: AppBar(title: Text('Dio demo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
