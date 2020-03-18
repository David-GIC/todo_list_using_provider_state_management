import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/provider/task.dart';
import 'package:todoey/screens/add_task.dart';
import 'package:todoey/screens/widget/task_list.dart';

class TaskScreen extends StatelessWidget {

  double _deviceWidth;
  double _deviceHeight;

  @override
  Widget build(BuildContext context) {

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    final TaskProvider _taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: ()
            => showModalBottomSheet(context: context, builder: (context)
              => AddTaskScreen((newTaskTitle) {
                    _taskProvider.addTask(newTaskTitle);
                  }
              ), backgroundColor: Color(0xff757575)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          child: Icon(Icons.list, size: 30,),
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                        SizedBox(height: 10.0,),
                        Text("Todoey", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
                        Text("${_taskProvider.taskCount} Tasks", style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                    ),
                    _taskProvider.doneTaskCount == 0 ? Icon(Icons.notifications, color: Colors.white,) : Badge(
                      badgeColor: Colors.red,
                      badgeContent: Text("${_taskProvider.doneTaskCount}", style: TextStyle(color: Colors.white),),
                      child: Icon(Icons.notifications, color: Colors.white,),
                    ),
                  ],
                ),
                ),
            Expanded(
              child: Container(
                height: _deviceHeight,
                width: _deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                  )
                ),
                child: TaskList()
              ),
            ),
          ],
        ),
    );
  }
}
