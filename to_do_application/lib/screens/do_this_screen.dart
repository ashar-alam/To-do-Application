import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/model/to_do_list.dart';
import 'package:to_do_application/services/firebase_services.dart';
import 'package:to_do_application/utils/app_style.dart';
import 'package:to_do_application/utils/string_manager.dart';

import '../utils/utils.dart';

class MyDoThisScreen extends StatefulWidget {
  const MyDoThisScreen({super.key});

  @override
  State<MyDoThisScreen> createState() => _MyDoThisScreenState();
}

class _MyDoThisScreenState extends State<MyDoThisScreen> {
  List<String> list = <String>[
    'Select day',
    'Monday',
    'Tuesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  // String? dropdownValue;
  TextEditingController dateinput = TextEditingController();

  List<Task> taskList = [];
  // String text = '';
  List<bool> isChecked = [];
  var indexHolder = [];
  TextEditingController title = TextEditingController();
  @override
  void initState() {
    // dateinput.text = "";
    super.initState();
    for (var element in taskList) {
      isChecked.add(false);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed;
    title.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Task newTask = Task.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringManager.doThis,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppStyle.primaryLight,
        actions: [
          const Center(
            child: Text(
              "Selected Items",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                for (var element in indexHolder) {
                  taskList.removeAt(element);
                  // print("data$data");
                }
                indexHolder.clear();
                // print(indexHolder);
                // print(isChecked);
                for (var element in taskList) {
                  isChecked.remove(true);
                }
              });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.black,
        elevation: 5,
        onPressed: () {
          setState(() {
            if (formkey.currentState!.validate()) {
              formkey.currentState!.save();
              log(newTask.toString());
              // String title1 = newTask.title;
              taskList.insert(0, (newTask));
              Provider.of<FirebaseServices>(context,listen: false).addTask(newTask);
              // FirebaseServices().addTask(newTask);
              isChecked.add(false);
            }
            title.clear();
            taskList.removeLast();
            // print("hello$data isChecked$isChecked");
          });
        },
        child: const Text("Save"),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        hint: const Text("Days"),
                        value: newTask.day.isEmpty ? 'Select day': newTask.day,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 5,
                        style: const TextStyle(color: AppStyle.primaryLight),
                        // underline: Container(
                        //   height: 2,
                        // ),
                        validator: (value) {
                          if (value!.isEmpty || value == 'Select day') {
                            return "Day is required";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          newTask.day = newValue!;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            newTask.day = value!;
                          });
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: Utils.getWidth(context) / 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: TextFormField(
                            controller: dateinput,
                            readOnly: true,
                            onSaved: (newValue) {
                              log(newValue!);
                              newTask.dateTime =
                                  DateFormat('dd-MM-yyyy').parse(newValue);
                            },
                            decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.only(left: 20),
                              hintText: StringManager.date,
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: AppStyle.black,
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030));
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                // print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                log("Date is not selected");
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Utils.getWidth(context),
                    height: Utils.getHight(context) / 1.1,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: AppStyle.lightGrey),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter title';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    newTask.title = newValue!;
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: StringManager.title,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    newTask.description = newValue!;
                                  },
                                  maxLines: null,
                                  autocorrect: true,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Enter something here.. "),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: taskList.length,
                          itemBuilder: ((context, index) {
                            return Card(
                              elevation: 0,
                              color: AppStyle.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.fiber_manual_record,
                                    size: 10,
                                  ),
                                  title: Text(taskList[index].title),
                                  subtitle: Text(taskList[index].description),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Checkbox(
                                            value: isChecked[index],
                                            onChanged: ((bool? value) {
                                              setState(
                                                () {
                                                  // List.forEach((element){
                                                  //   if(value== true){
                                                  //     indexHolder.add(index);
                                                  //   }
                                                  // }
                                                  // );
                                                  // isChecked = value! as List<bool>;
                                                  isChecked[index] =
                                                      !isChecked[index];
                                                  if (isChecked[index] ==
                                                      true) {
                                                    indexHolder.add(index);
                                                    // print(indexHolder);
                                                  } else {
                                                    indexHolder.remove(index);
                                                    // print(indexHolder);
                                                  }
                                                },
                                              );
                                            }),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    SimpleDialog(
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          15.0),
                                                  // titlePadding: const EdgeInsets.all(40.0),
                                                  children: [
                                                    const Center(
                                                        child: Text(
                                                      "Edit To-Do",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    const Divider(
                                                      thickness: 1,
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter Text here"),
                                                      onChanged: (value) {
                                                        setState(
                                                          () {
                                                            newTask.title =
                                                                value;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  AppStyle
                                                                      .black),
                                                      onPressed: () {
                                                        setState(() {
                                                          // newTask.description = text!;
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      child:
                                                          const Text("update"),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                taskList.removeAt(index);
                                                // indexHolder.removeAt(index);
                                                // print("data$data");
                                              });
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
