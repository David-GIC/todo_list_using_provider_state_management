import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function deleteBoxCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkBoxCallback, this.deleteBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle, style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
      leading: Icon(Icons.touch_app),
      onLongPress: deleteBoxCallback,
    );
  }
}

