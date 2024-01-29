import 'package:ai_chatbot/chat_bot.dart';
import 'package:ai_chatbot/firebase_options.dart';
import 'package:ai_chatbot/getPackage.dart';
import 'package:ai_chatbot/login_screen.dart';
import 'package:ai_chatbot/otpless/otpless.dart';
import 'package:ai_chatbot/payments/razorpay_intergration.dart';
import 'package:ai_chatbot/payments/upi.dart';
import 'package:ai_chatbot/payments/upi_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI ChatBot',
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      // home: const OtpLessLogin(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        //... Rest of the StreamBuilder code

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return LoginPage();
            } else {
              return ChatBot();
              // return Text(snapshot.data);
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
