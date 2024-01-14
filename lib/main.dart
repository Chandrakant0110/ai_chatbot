import 'package:ai_chatbot/chat_bot.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI ChatBot',
      debugShowCheckedModeBanner: false,
      home: ChatBot(),
    );
  }
}
