// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDun1ysS8qkR1bvWp0VUmeqjNCuAyC7zTU',
    appId: '1:443636381016:web:b42c5095462088c41ca12d',
    messagingSenderId: '443636381016',
    projectId: 'malavan1-d2dbb',
    authDomain: 'malavan1-d2dbb.firebaseapp.com',
    storageBucket: 'malavan1-d2dbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZKfMGMGLssCUk1gRkoe1fj29_zxDc2Bs',
    appId: '1:443636381016:android:6e4f7b02cfd50a5c1ca12d',
    messagingSenderId: '443636381016',
    projectId: 'malavan1-d2dbb',
    storageBucket: 'malavan1-d2dbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgP4joSsL5qkb9BYZKn_U_J1HfnT_2Bs8',
    appId: '1:443636381016:ios:3db86448fd7399e91ca12d',
    messagingSenderId: '443636381016',
    projectId: 'malavan1-d2dbb',
    storageBucket: 'malavan1-d2dbb.appspot.com',
    iosBundleId: 'com.example.malavan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgP4joSsL5qkb9BYZKn_U_J1HfnT_2Bs8',
    appId: '1:443636381016:ios:3db86448fd7399e91ca12d',
    messagingSenderId: '443636381016',
    projectId: 'malavan1-d2dbb',
    storageBucket: 'malavan1-d2dbb.appspot.com',
    iosBundleId: 'com.example.malavan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDun1ysS8qkR1bvWp0VUmeqjNCuAyC7zTU',
    appId: '1:443636381016:web:f76772d2be68f6a91ca12d',
    messagingSenderId: '443636381016',
    projectId: 'malavan1-d2dbb',
    authDomain: 'malavan1-d2dbb.firebaseapp.com',
    storageBucket: 'malavan1-d2dbb.appspot.com',
  );

}