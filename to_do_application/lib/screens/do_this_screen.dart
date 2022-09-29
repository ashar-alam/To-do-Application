import 'package:flutter/material.dart';
import 'package:to_do_application/utils/app_style.dart';
import 'package:to_do_application/utils/string_manager.dart';

import '../utils/utils.dart';

class MyDoThisScreen extends StatefulWidget {
  const MyDoThisScreen({super.key});

  @override
  State<MyDoThisScreen> createState() => _MyDoThisScreenState();
}

class _MyDoThisScreenState extends State<MyDoThisScreen> {
  List<String> data = [
    // 'hello', 'ashar', 'welcome', 'world'
  ];
  String text = '';
  List<bool> isChecked = [];
  var indexHolder = [];
  TextEditingController title = TextEditingController();
  @override
  void initState() {
    super.initState();
    for (var element in data) {
      isChecked.add(false);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    title.dispose();
    super.dispose();
  }

  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringManager.doThis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                  data.removeAt(element);
                  // print("data$data");
                }
                indexHolder.clear();
                // print(indexHolder);
                // print(isChecked);
                for (var element in data) {
                  isChecked.remove(true);
                }
                
              });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primaryLight,
        elevation: 5,
        onPressed: () {
          setState(() {
            if (formkey.currentState!.validate()) {
              String title1 = title.text;
              data.insert(0, (title1));
              isChecked.add(false);
            }
            title.clear();
            // MyTextFormFeild();

            // data.removeLast();

            // print("hello$data isChecked$isChecked");
          });
        },
        child:
            // Text("remove"),
            const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                width: Utils.getWidth(context)/1.15,
                child: TextFormField(onSaved: (newValue) {
                  
                },
                  decoration: InputDecoration(
                    // focusColor: AppStyle.black,
                    contentPadding: const EdgeInsets.only(left: 20),
                    // fillColor: AppStyle.grey,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // prefixIcon: const Icon(Icons.search),
                    hintText: StringManager.title,
                  ),
                ),
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
                        child: Form(
                          key: formkey,
                          child: TextFormField(
                            
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            maxLines: null,
                            autocorrect: true,
                            controller: title,
                            decoration: const InputDecoration(
                              contentPadding:  EdgeInsets.only(left: 20),
                                hintText: "Content of the list "),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            elevation: 0,
                            color: AppStyle.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const Icon(Icons.fiber_manual_record,size: 10,),
                                title: Text(data[index]),
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
                                                if (isChecked[index] == true) {
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
                                                children: [
                                                  TextField(
                                                    onChanged: (value) {
                                                      setState(
                                                        () {
                                                          text = value;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                AppStyle.white),
                                                    onPressed: () {
                                                      setState(() {
                                                        data[index] = text;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child: const Text("update"),
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
                                              data.removeAt(index);
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
    );
  }
}
