class Task {

  final String name;
  bool isDone;

  Task({this.name, this.isDone});

  bool toggleDone(){
    isDone = !isDone;
    return isDone;
  }
}