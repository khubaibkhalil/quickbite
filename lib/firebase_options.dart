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
    apiKey: 'AIzaSyCHdNpWyJeyLxLirHXv__lU91Pqj44TIz0',
    appId: '1:579466048233:web:09b90802d816840184b678',
    messagingSenderId: '579466048233',
    projectId: 'quickbite-9f80a',
    authDomain: 'quickbite-9f80a.firebaseapp.com',
    storageBucket: 'quickbite-9f80a.appspot.com',
    databaseURL: 'https://quickbite-9f80a-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqaPSoi8UregSpWOgFbukB1hl9fqVODO4',
    appId: '1:579466048233:android:c185b78bee2e0da984b678',
    messagingSenderId: '579466048233',
    projectId: 'quickbite-9f80a',
    storageBucket: 'quickbite-9f80a.appspot.com',
    databaseURL: 'https://quickbite-9f80a-default-rtdb.firebaseio.com/',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlqfBeYdHfJEv_uz0mg0E2SJZm0KkW7CY',
    appId: '1:579466048233:ios:c1171810ea73125b84b678',
    messagingSenderId: '579466048233',
    projectId: 'quickbite-9f80a',
    storageBucket: 'quickbite-9f80a.appspot.com',
    databaseURL: 'https://quickbite-9f80a-default-rtdb.firebaseio.com/',
    iosBundleId: 'com.example.quickbite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlqfBeYdHfJEv_uz0mg0E2SJZm0KkW7CY',
    appId: '1:579466048233:ios:d46549e8364a91a284b678',
    messagingSenderId: '579466048233',
    projectId: 'quickbite-9f80a',
    storageBucket: 'quickbite-9f80a.appspot.com',
    databaseURL: 'https://quickbite-9f80a-default-rtdb.firebaseio.com/',
    iosBundleId: 'com.example.quickbite.RunnerTests',
  );
}