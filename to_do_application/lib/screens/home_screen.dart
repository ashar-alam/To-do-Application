import 'package:flutter/material.dart';
import 'package:to_do_application/utils/app_style.dart';
import 'package:to_do_application/utils/string_manager.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppStyle.primaryLight,
        title: const Text(StringManager.homeScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                // focusColor: AppStyle.black,
                contentPadding: const EdgeInsets.all(8.0),
                // fillColor: AppStyle.grey,

                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                prefixIcon: const Icon(Icons.search),
                hintText: StringManager.searchForTaskEventsetc,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.my_library_books_outlined),
                        Text(StringManager.allTasks),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
