import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/provider/task.dart';
import 'package:todoey/screens/widget/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskProvider _taskProvider = Provider.of<TaskProvider>(context);
    if(_taskProvider.taskCount > 0){
      return Consumer<TaskProvider>(
        builder: (context, _taskProvider, child){
          return Scrollbar(
            child: ListView.builder(
                itemCount: _taskProvider.taskList.length,
                itemBuilder: (context, index) {
                  var task = _taskProvider.taskList[index];
                  return TaskTile(
                    taskTitle: _taskProvider.taskList[index].name,
                    isChecked: _taskProvider.taskList[index].isDone,
                    checkBoxCallback: (checkBoxState) {
                      _taskProvider.updateTask(task);
                    },
                    deleteBoxCallback: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) =>
                            _buildActionSheet(context, _taskProvider, index, _taskProvider.taskList[index])
                    ),
                  );
                }),
          );
        },
      );
    }else{
      return CircularProgressIndicator();
    }
  }

  Widget _buildActionSheet(
      BuildContext context, TaskProvider _taskProvider, int index, Task task) {
    return CupertinoActionSheet(
      title: Text("Do you really want to delete it?"),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Delete"),
          isDestructiveAction: true,
          onPressed: () {
            _taskProvider.deleteTask(index, task);
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
