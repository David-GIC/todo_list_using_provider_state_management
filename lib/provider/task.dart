import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskProvider extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: "Complete Mock up design", isDone: true),
    Task(name: "Implement Static UI", isDone: false),
    Task(name: "Apply Logic", isDone: false),
    Task(name: "Testing", isDone: false),
    Task(name: "Defense Thesic", isDone: false),
  ];

  int _countDoneTask = 1;

  get taskList => _tasks;
  get taskCount => _tasks.length;
  get doneTaskCount => _countDoneTask;

  void addTask(String newTaskTitle) {
    var task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index, Task task) {
    _tasks.removeAt(index);
    if(task.isDone){
      decrementDoneTask();
    }
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    if(task.isDone){
      incrementDoneTask();
    }else{
      decrementDoneTask();
    }
    notifyListeners();
  }

  void incrementDoneTask(){
    _countDoneTask++;
    notifyListeners();
  }

  void decrementDoneTask(){
    if(_countDoneTask > 0){
      _countDoneTask--;
    }
    notifyListeners();
  }

}
