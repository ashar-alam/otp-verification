import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_verification/screen/dash_board.dart';
import 'package:otp_verification/service/auth/otp_verification.service.dart';

import '../utils/string_manager.dart';
import '../utils/utils.dart';

class MyOtpScreen extends StatefulWidget {
  const MyOtpScreen({super.key});

  @override
  State<MyOtpScreen> createState() => _MyOtpScreenState();
}

class _MyOtpScreenState extends State<MyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          StringManager.optVerification,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringManager.phoneVerification,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),

                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {
                  OtpService.verifyOtp(verificationCode)
                      .then((UserCredential user) {
                    if (user != null) {
                      log(user.user!.phoneNumber.toString());
                      log(user.user!.uid);
                      log(user.user!.displayName.toString());
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const MyDashboard(),
                          ),
                          (route) => false);
                    } else {
                      log("Error");
                    }
                  });

                  // showDialog(
                  //   useSafeArea: false,
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       // elevation: 5,
                  //       // actionsPadding:const EdgeInsets.symmetric(horizontal: 50.0) ,
                  //       title: const Text("Verification Code"),
                  //       content: Text('Code entered is $verificationCode'),
                  //     );
                  //   },
                  // );
                }, // end onSubmit
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
                        builder: (context) => const MyOtpScreen(),
                      ),
                    );
                  },
                  child: const Text(StringManager.verifyPhoneNumber),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  StringManager.editphoneNumber,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
