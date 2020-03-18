import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/task.dart';
import 'package:todoey/screens/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ListenableProvider<TaskProvider>(create: (_) => TaskProvider()),
        ],
        child: TaskScreen(),
      ),
    );
  }
}
