
import 'package:flutter/material.dart';
import 'package:otp_verification/utils/route.dart';

import '../screen/home_screen.dart';

class RoutesManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const MyHomeScreen());
     
        
      default:
        return MaterialPageRoute(
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