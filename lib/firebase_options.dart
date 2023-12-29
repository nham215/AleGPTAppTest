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
    apiKey: 'AIzaSyDn1MiSCLO64AfoeW0eAFVKV4goRU1lQeQ',
    appId: '1:240630528908:web:45ae1466d713ee93deb4a9',
    messagingSenderId: '240630528908',
    projectId: 'flutterauth-70029',
    authDomain: 'flutterauth-70029.firebaseapp.com',
    storageBucket: 'flutterauth-70029.appspot.com',
    measurementId: 'G-EK9QLQ3N8W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKI3v5VV77n3-VfT9kf7iz7wBovvecVl0',
    appId: '1:240630528908:android:11cfc82bdb16a96ddeb4a9',
    messagingSenderId: '240630528908',
    projectId: 'flutterauth-70029',
    storageBucket: 'flutterauth-70029.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCscJyxuFWiCg0p70RJT_or7G22Kn9eOmQ',
    appId: '1:240630528908:ios:a18ec48c9bb03994deb4a9',
    messagingSenderId: '240630528908',
    projectId: 'flutterauth-70029',
    storageBucket: 'flutterauth-70029.appspot.com',
    androidClientId: '240630528908-gv2d2t3a0egsmkh6s8h9vftjlbtef4la.apps.googleusercontent.com',
    iosClientId: '240630528908-jim4dsmjp0nqnhavt91e4ljpbdeb2jal.apps.googleusercontent.com',
    iosBundleId: 'com.example.learn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCscJyxuFWiCg0p70RJT_or7G22Kn9eOmQ',
    appId: '1:240630528908:ios:78cb8e259d175020deb4a9',
    messagingSenderId: '240630528908',
    projectId: 'flutterauth-70029',
    storageBucket: 'flutterauth-70029.appspot.com',
    androidClientId: '240630528908-gv2d2t3a0egsmkh6s8h9vftjlbtef4la.apps.googleusercontent.com',
    iosClientId: '240630528908-pv3jvp2s3g1q0fleh81cfb305budnuhl.apps.googleusercontent.com',
    iosBundleId: 'com.example.learn.RunnerTests',
  );
}
