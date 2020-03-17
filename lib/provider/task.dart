import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: "Complete Mock up design", isDone: true),
    Task(name: "Implement Static UI", isDone: false),
    Task(name: "Apply Logic", isDone: false),
    Task(name: "Testing", isDone: false),
    Task(name: "Defense Thesic", isDone: false),
  ];

  get taskList => _tasks;
  get taskCount => _tasks.length;

  void addTask(String newTaskTitle){
    var task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

}