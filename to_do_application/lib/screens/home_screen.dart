import 'package:flutter/material.dart';
import 'package:to_do_application/screens/all_task.dart';
import 'package:to_do_application/screens/do_this_screen.dart';
import 'package:to_do_application/screens/login_screen.dart';
import 'package:to_do_application/services/firebase_services.dart';
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
        actions: [
          TextButton.icon(
            // style: ButtonStyle(),
            onPressed: () {
              FirebaseServices().signOutGoogle();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyLoginScreen()));
            },
            icon: const Icon(
              Icons.logout,
              color: AppStyle.white,
            ),
            label: const Text(
              StringManager.logOut,
              style: TextStyle(color: AppStyle.white),
            ),
          ),
          // IconButton(onPressed: (){}, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        color: AppStyle.lightGrey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                StringManager.welcomeToOurTodoApplication,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     // focusColor: AppStyle.black,
              //     contentPadding: const EdgeInsets.only(left: 20,right: 20),
              //     // fillColor: AppStyle.grey,

              //     border:
              //         OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              //     suffixIcon: const Icon(Icons.search),
              //     hintText: StringManager.searchForTaskEventsetc,
              //   ),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 100,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyAllTask()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.my_library_books_outlined),
                              Text(
                                StringManager.allTasks,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 100,
                      child: InkWell(
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.calendar_month_outlined),
                              Text(
                                StringManager.next7Days,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyDoThisScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyDoThisScreen()));
                },
                backgroundColor: AppStyle.primaryLight,
                child: const Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
