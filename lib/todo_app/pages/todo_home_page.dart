import 'package:assignment3/todo_app/data/tasks_data.dart';
import 'package:assignment3/todo_app/models/task_model.dart';
import 'package:assignment3/todo_app/pages/all_tasks.dart';
import 'package:assignment3/todo_app/pages/complete_tasks.dart';
import 'package:assignment3/todo_app/pages/incomplete_tasks.dart';
import 'package:flutter/material.dart';


class TodoHomePage extends StatefulWidget {
  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  changeTaskCompleteness(Task task) {
    int index = tasksList.indexOf(task);
    tasksList[index].isCompleted = !tasksList[index].isCompleted;
    setState(() {});
  }

  remove(Task task) {
    tasksList.removeWhere((element) => element==task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TODO APP'),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'All Tasks',
              ),
              Tab(
                icon: Icon(Icons.done),
                text: 'Complete Tasks',
              ),
              Tab(
                icon: Icon(Icons.cancel),
                text: 'InComplete Tasks',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              AllTasksScreen(changeTaskCompleteness,remove),
              CompleteTasksScreen(changeTaskCompleteness,remove),
              InCompleteTasksScreen(changeTaskCompleteness,remove)
            ],
          ),
        ));
  }
}
