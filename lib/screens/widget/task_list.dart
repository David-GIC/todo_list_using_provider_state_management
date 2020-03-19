import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task.dart';
import 'package:todoey/screens/widget/task_tile.dart';
import 'package:todoey/utils/widget/action_sheet.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskProvider _taskProvider = Provider.of<TaskProvider>(context);
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
                            ShowActionSheet(_taskProvider, index, _taskProvider.taskList[index])
                    ),
                  );
                }),
          );
        },
      );
  }
}
