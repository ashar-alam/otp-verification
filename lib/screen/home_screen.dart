import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../utils/string_manager.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          StringManager.optVerification,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringManager.phoneNo,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextField(
                decoration: InputDecoration(hintText: StringManager.phoneNo),
              ),
              const SizedBox(height: 20,),
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),

                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {
                  showDialog(
                    useSafeArea: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // elevation: 5,
                          // actionsPadding:const EdgeInsets.symmetric(horizontal: 50.0) ,
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              const SizedBox(height: 30,),
              Center(child: ElevatedButton(onPressed: (){}, child: const Text(StringManager.submit)))
            ],
          ),
        ),
      ),
    );
  }
}
