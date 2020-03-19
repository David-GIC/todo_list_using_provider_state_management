import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task.dart';
import 'package:todoey/screens/widget/task_tile.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Done Tasks"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: taskProvider.taskList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                taskTitle: taskProvider.taskList[index].name,
                isChecked: taskProvider.taskList[index].isDone,
              );
            }
        ),
      ),
    );

  }


}
