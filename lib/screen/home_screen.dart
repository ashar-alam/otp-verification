import 'package:flutter/material.dart';
import 'package:otp_verification/screen/otp_screen.dart';
import 'package:otp_verification/service/auth/otp_verification.service.dart';

import '../utils/string_manager.dart';
import '../utils/utils.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  String? phoneNumber;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StringManager.phoneNo,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Number is Required";
                  }
                },
                onSaved: (newValue) {
                  phoneNumber = newValue!;
                },
                decoration: const InputDecoration(
                    prefixText: "+91 |", hintText: StringManager.phoneNo),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Utils.getWidth(context) / 1,
                height: Utils.getHight(context) / 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      OtpService.sendOtp("+91${phoneNumber!}");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyOtpScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(StringManager.sendTheCode),
                ),
              ),
              const Divider(
                
                thickness: 1,
              ),
              Center(
                child: SizedBox(
                  width: Utils.getWidth(context) / 1.5,
                  height: Utils.getHight(context) / 15,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:const [
                          Icon(Icons.add),
                          Text(
                            StringManager.google,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
