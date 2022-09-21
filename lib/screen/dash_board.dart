import 'package:flutter/material.dart';
import 'package:otp_verification/screen/home_screen.dart';

import '../utils/string_manager.dart';
import '../utils/utils.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(StringManager.welcomeToOurApplication),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              StringManager.welcome,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Utils.getWidth(context) / 1.2,
            height: Utils.getHight(context) / 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomeScreen(),
                  ),
                );
              },
              child: const Text(StringManager.logout),
            ),
          ),
        ],
      ),
    );
  }
}
