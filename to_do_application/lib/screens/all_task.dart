
import 'package:flutter/material.dart';
import 'package:to_do_application/utils/app_style.dart';
import 'package:to_do_application/utils/string_manager.dart';
import 'package:to_do_application/widgets/list_view.dart';

class MyAllTask extends StatefulWidget {
  const MyAllTask({super.key});

  @override
  State<MyAllTask> createState() => _MyAllTaskState();
}

class _MyAllTaskState extends State<MyAllTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringManager.allTasks,
          style: TextStyle(),
        ),
        backgroundColor: AppStyle.primaryLight,
      ),
      body: Container(
        color: AppStyle.lightGrey,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: 
          MyListView(),
          // Center(
          //   child: Text(
          //     StringManager.thereIsNoTasks,
          //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ),
      ),
    );
  }
}
