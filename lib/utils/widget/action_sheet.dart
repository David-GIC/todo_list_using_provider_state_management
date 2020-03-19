import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/provider/task.dart';

class ShowActionSheet extends StatelessWidget {
  Task task;
  int index;
  TaskProvider taskProvider;
  ShowActionSheet(this.taskProvider, this.index, this.task);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("Do you really want to delete it?"),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Delete"),
          isDestructiveAction: true,
          onPressed: () {
            taskProvider.deleteTask(index, task);
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Cancel"),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
