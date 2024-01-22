import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<ChatMessage> messages = [];
  List<ChatUser> typing = [];

  ChatUser sender =
      ChatUser(id: '1', firstName: "Chandrakant", lastName: "Sahu");
  ChatUser bot = ChatUser(id: '2', firstName: "AI");

  final url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCDL4goG1S9TgOEAsQiI-TbdRm7IGfK6B0';
  final headers = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    messages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);
          print(result['candidates'][0]['content']['parts'][0]['text']);
          ChatMessage m1 = ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: result['candidates'][0]['content']['parts'][0]['text'],
          );

          messages.insert(0, m1);
        } else {
          print('error-eccoured');
        }
      },
    ).catchError((e) {});

    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'AI ChatBot',
            style: TextStyle(
              fontFamily: 'MontSerrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Text('bottom Navigation Bar'),
      body: DashChat(
        typingUsers: typing,
        currentUser: sender,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: messages,
      ),
    );
  }
}
