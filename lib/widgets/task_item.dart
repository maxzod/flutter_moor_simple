import 'package:flutter/material.dart';
import 'package:tasker/db/tasks_dao.dart';
import 'package:tasker/db/tasks_database.dart';

class TaskItem extends StatefulWidget {
  Task taskitem ;

  TaskItem(this.taskitem);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
bool status  ;
@override
  void initState() {
  status = widget.taskitem.completed;    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(widget.taskitem.name),
          ),
        ),
        Checkbox(
          value: status ,
          onChanged: (val)async{
            Task item = Task(id:  widget.taskitem.id,name:  widget.taskitem.name,completed: val);
            await TaskDao(AppDatabase()).updateTask(item);
            setState(() {
              status = val;

            });
          },
        )
      ],
    );
  }
}
