import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_application/utils/routes.dart';
import 'package:to_do_application/utils/routes_manager.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // TODO : wrap within MultiProvider, pass instance of FirebaseServices
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.generateRoute,
      // TODO: add state managment according to user login status
      // initialRoute:UserService.currentUser == null ? Routes.login : Routes.dashboard,
      initialRoute: Routes.login,
    );
  }
}
