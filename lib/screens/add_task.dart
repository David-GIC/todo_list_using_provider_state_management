import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {

  String taskTitle;
  Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
          )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text("Add Task", style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                onChanged: (text){
                  taskTitle = text;
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  addTaskCallback(taskTitle);
                  Navigator.pop(context);
                },
                child: Text("Add", style: TextStyle(color: Colors.white),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
