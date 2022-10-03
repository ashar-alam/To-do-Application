import 'package:flutter/material.dart';
import 'package:to_do_application/screens/dashboard.dart';
import 'package:to_do_application/utils/routes.dart';

import '../screens/login_screen.dart';

class RoutesManager{
  static Route<dynamic>generateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_)=> const MyLoginScreen());
        
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_)=> const DashBoardScreen());

        
      default: return MaterialPageRoute(
          builder: (_) => const Scaffold(
            // backgroundColor: AppStyle.purpleDark,
            body: SafeArea(
              child: Center(
                child: Text(
                  'No Route Found',
                  // style: AppStyle.generalTextStyle(
                  //   color: AppStyle.white,
                  // ),
                ),
              ),
            ),
          ),
        );
    }
  }
}