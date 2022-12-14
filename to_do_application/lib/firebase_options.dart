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
    apiKey: 'AIzaSyCffJqXkyWjEUzzBPhwGx9e0yxHLCIJVvU',
    appId: '1:888010705272:web:a31c8651381230d6a1a08d',
    messagingSenderId: '888010705272',
    projectId: 'to-do-application-f02dc',
    authDomain: 'to-do-application-f02dc.firebaseapp.com',
    storageBucket: 'to-do-application-f02dc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmLHFb1o3QaP2FPskQj_P2VHIR3sQW_x0',
    appId: '1:888010705272:android:69e3bc10e8e95c2aa1a08d',
    messagingSenderId: '888010705272',
    projectId: 'to-do-application-f02dc',
    storageBucket: 'to-do-application-f02dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJlIcQyYHL0xWnBRmF8TdboW8Y2-vKxzM',
    appId: '1:888010705272:ios:e8ada90ec3fa4c5ca1a08d',
    messagingSenderId: '888010705272',
    projectId: 'to-do-application-f02dc',
    storageBucket: 'to-do-application-f02dc.appspot.com',
    iosClientId: '888010705272-6rggke4tpq5djtiupt701acn7p7jbdq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.toDoApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJlIcQyYHL0xWnBRmF8TdboW8Y2-vKxzM',
    appId: '1:888010705272:ios:e8ada90ec3fa4c5ca1a08d',
    messagingSenderId: '888010705272',
    projectId: 'to-do-application-f02dc',
    storageBucket: 'to-do-application-f02dc.appspot.com',
    iosClientId: '888010705272-6rggke4tpq5djtiupt701acn7p7jbdq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.toDoApplication',
  );
}
