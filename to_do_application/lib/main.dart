import 'package:flutter/material.dart';
import 'package:to_do_application/utils/routes.dart';
import 'package:to_do_application/utils/routes_manager.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.generateRoute,
      initialRoute: Routes.login,
    );
  }
}