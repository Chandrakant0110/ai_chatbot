// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRTgVD0yK4y3FC7P1Mbh9dvYpr2u7KaJM',
    appId: '1:458560226174:web:76ba753964e6914412292f',
    messagingSenderId: '458560226174',
    projectId: 'ai-bot-be61d',
    authDomain: 'ai-bot-be61d.firebaseapp.com',
    storageBucket: 'ai-bot-be61d.appspot.com',
    measurementId: 'G-LJBL2V1S52',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUtB3nu31ll-nRM7vDoF_dXD3yL6kylKo',
    appId: '1:458560226174:android:ad6cd1ce594e2ba112292f',
    messagingSenderId: '458560226174',
    projectId: 'ai-bot-be61d',
    storageBucket: 'ai-bot-be61d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVEBRARV9DIfHuLJGyfnQGXraxPUL297s',
    appId: '1:458560226174:ios:8009c278bf70471c12292f',
    messagingSenderId: '458560226174',
    projectId: 'ai-bot-be61d',
    storageBucket: 'ai-bot-be61d.appspot.com',
    androidClientId: '458560226174-c47uh25t06skh1rnm7id5g4uefuehmr3.apps.googleusercontent.com',
    iosClientId: '458560226174-j6bletig4dri397rdvn6agl683o2isg3.apps.googleusercontent.com',
    iosBundleId: 'com.example.aiChatbot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVEBRARV9DIfHuLJGyfnQGXraxPUL297s',
    appId: '1:458560226174:ios:27ca292cd832384f12292f',
    messagingSenderId: '458560226174',
    projectId: 'ai-bot-be61d',
    storageBucket: 'ai-bot-be61d.appspot.com',
    androidClientId: '458560226174-c47uh25t06skh1rnm7id5g4uefuehmr3.apps.googleusercontent.com',
    iosClientId: '458560226174-ll2hbbn5infn4perj66ijfjftgouccvu.apps.googleusercontent.com',
    iosBundleId: 'com.example.aiChatbot.RunnerTests',
  );
}