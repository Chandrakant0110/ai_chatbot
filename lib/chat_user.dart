// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';
// import 'package:ai_chatbot/secrets.dart';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';


// class ChatScreen extends StatefulWidget {
//   final String username;
//   final String uuid;

//   ChatScreen({required this.username, required this.uuid});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   ChatUser user = ChatUser();

//   @override
//   void initState() {
//     user.name = widget.username;
//     user.uid = widget.uuid;
//     super.initState();
//   }

//   void onSend(ChatMessage message) {
//     var documentReference = Firestore.instance
//         .collection('messages')
//         .document(DateTime.now().millisecondsSinceEpoch.toString());

//     Firestore.instance.runTransaction((transaction) async {
//       await transaction.set(
//         documentReference,
//         message.toJson(),
//       );
//     });
//   }

//   void uploadFile() async {
//     File result = await ImagePicker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//       maxHeight: 400,
//       maxWidth: 400,
//     );

//     if (result != null) {
//       String id = Uuid().v4().toString();

//       final StorageReference storageRef =
//           FirebaseStorage.instance.ref().child("chat_images/$id.jpg");

//       StorageUploadTask uploadTask = storageRef.putFile(
//         result,
//         StorageMetadata(
//           contentType: 'image/jpg',
//         ),
//       );
//       StorageTaskSnapshot download = await uploadTask.onComplete;

//       String url = await download.ref.getDownloadURL();

//       ChatMessage message = ChatMessage(text: "", user: user, image: url);

//       var documentReference = Firestore.instance
//           .collection('messages')
//           .document(DateTime.now().millisecondsSinceEpoch.toString());

//       Firestore.instance.runTransaction((transaction) async {
//         await transaction.set(
//           documentReference,
//           message.toJson(),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dash Chat"),
//       ),
//       body: StreamBuilder(
//         stream: Firestore.instance.collection('messages').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                     Theme.of(context).primaryColor),
//               ),
//             );
//           } else {
//             List<DocumentSnapshot> items = snapshot.data.documents;
//             var messages =
//                 items.map((i) => ChatMessage.fromJson(i.data)).toList();
//             return DashChat(
//               user: user,
//               messages: messages,
//               inputDecoration: InputDecoration(
//                 hintText: "Message here...",
//                 border: InputBorder.none,
//               ),
//               onSend: onSend,
//               trailing: <Widget>[
//                 IconButton(
//                   icon: Icon(Icons.photo),
//                   onPressed: uploadFile,
//                 )
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }