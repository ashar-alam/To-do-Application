import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/services/firebase_services.dart';
import 'package:to_do_application/utils/routes.dart';
import 'package:to_do_application/utils/routes_manager.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseServices services = FirebaseServices();
  await services.init();
  runApp(MultiProvider(providers: [
    Provider(create: (_) => services),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.generateRoute,
      initialRoute: Provider.of<FirebaseServices>(context).currentUser == null
          ? Routes.login
          : Routes.dashboard,
      // initialRoute: Routes.login,
    );
  }
}
