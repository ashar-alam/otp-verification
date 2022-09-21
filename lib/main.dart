import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/utils/route.dart';
import 'package:otp_verification/utils/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCgIyC3UaSC51_I0XPj1SSt9jHvMHtASAM",
        appId: "1:1009209496328:web:2deb0d8d63b5141a29d2bd",
        messagingSenderId: "1009209496328",
        projectId: "otp-verification-b8bba"),
  );

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
