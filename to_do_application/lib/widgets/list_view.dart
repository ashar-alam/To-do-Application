import 'package:flutter/material.dart';

import '../model/to_do_list.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
  return  StreamBuilder<List<Task>>(
    stream: null,
    builder: (context, snapshot) {
      return ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.circle_sharp,
                  size: 15,
                ),
                trailing: const Text(
                  "Hello",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("$index"),
              ),
            );
          },
        );
    }
  );
  }
}
