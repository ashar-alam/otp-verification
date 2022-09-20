import 'package:flutter/material.dart';
import 'package:otp_verification/utils/route.dart';
import 'package:otp_verification/utils/routes_manager.dart';

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
      initialRoute: Routes.homeScreen,
    );
  }
}
