import 'package:firebase_auth/firebase_auth.dart';

class OtpService {
  static ConfirmationResult? confirmationResult;

  static void sendOtp(String num) async {
    FirebaseAuth auth = FirebaseAuth.instance;

// Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
    confirmationResult = await auth.signInWithPhoneNumber(num);
  }

  static Future<UserCredential> verifyOtp(String otp) async {
    UserCredential userCredential = await confirmationResult!.confirm(otp);
    return userCredential;
  }
}
