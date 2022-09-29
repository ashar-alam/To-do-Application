import 'package:flutter/material.dart';
import 'package:to_do_application/screens/services/firebase_services.dart';
import 'package:to_do_application/utils/app_style.dart';

import '../utils/string_manager.dart';
import '../utils/utils.dart';
import 'home_screen.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        centerTitle: true,
        title: const Text(StringManager.loginScreen),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/imageIcon.jpg"),
              Container(
                color: AppStyle.lightGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        StringManager.organizeYourLifeInSeconds,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        StringManager
                            .seeHowMillionsOfPeopleRelyOnAnyDoToStayOrganized,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppStyle.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: Utils.getWidth(context) / 1.2,
                        height: Utils.getHight(context) / 15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: AppStyle.primaryLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // FirebaseServices();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyHomeScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/googleIcon.jpg",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                StringManager.continueWithGoolge,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: Utils.getWidth(context) / 1.2,
                        height: Utils.getHight(context) / 15,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            backgroundColor: AppStyle.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/mail.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                StringManager.continueWithGmail,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppStyle.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                              StringManager.dontHaveAccountCreateAnAccount))
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
