import 'dart:math';

import 'package:ai_chatbot/chat_bot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final rec = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
              },
              icon: Icon(
                Icons.power_settings_new_sharp,
              ),
            ),
          ],
          title: Text('Login'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: Text('Click Here'),
              )
            ],
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ChatBot()));

      print(userCredential.user?.displayName);
      print(userCredential.user?.email);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
