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
    apiKey: 'AIzaSyD-ZUKYdE-QMVME82p7Z2lOKijAttjFHnA',
    appId: '1:924365799629:web:58959b0bfffaab9d736984',
    messagingSenderId: '924365799629',
    projectId: 'recipe-api-cee2b',
    authDomain: 'recipe-api-cee2b.firebaseapp.com',
    storageBucket: 'recipe-api-cee2b.appspot.com',
    measurementId: 'G-LSKSHSJKEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCVIvEKVq8yeMz9QAMC0yhn3r_bIPNB5s',
    appId: '1:924365799629:android:46154f4de3a204c4736984',
    messagingSenderId: '924365799629',
    projectId: 'recipe-api-cee2b',
    storageBucket: 'recipe-api-cee2b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9kj4wkP4RCcePeJ9dYzOIjJsPrESZmSk',
    appId: '1:924365799629:ios:490415ee444ee1b1736984',
    messagingSenderId: '924365799629',
    projectId: 'recipe-api-cee2b',
    storageBucket: 'recipe-api-cee2b.appspot.com',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9kj4wkP4RCcePeJ9dYzOIjJsPrESZmSk',
    appId: '1:924365799629:ios:d0e7ec304fa98ab0736984',
    messagingSenderId: '924365799629',
    projectId: 'recipe-api-cee2b',
    storageBucket: 'recipe-api-cee2b.appspot.com',
    iosBundleId: 'com.example.project1.RunnerTests',
  );
}
