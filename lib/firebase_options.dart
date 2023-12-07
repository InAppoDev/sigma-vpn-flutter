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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgNSFOjhpimiw6uB45dTb0E9rXzTOu1Qc',
    appId: '1:448127724484:android:63b6cd24d670fb49b59291',
    messagingSenderId: '448127724484',
    projectId: 'sigmavpnservice',
    databaseURL: 'https://sigmavpnservice.firebaseio.com',
    storageBucket: 'sigmavpnservice.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOdTq-_URrEKKL5HO3Ct8MnKWjf--6eP8',
    appId: '1:448127724484:ios:b6535486dbcbe418b59291',
    messagingSenderId: '448127724484',
    projectId: 'sigmavpnservice',
    databaseURL: 'https://sigmavpnservice.firebaseio.com',
    storageBucket: 'sigmavpnservice.appspot.com',
    androidClientId: '448127724484-fgc2hrnhgovaodg0tan1eg9aul6dn1k6.apps.googleusercontent.com',
    iosClientId: '448127724484-k5ss8aseqvjj2utn8a4olfk3jumsfmm6.apps.googleusercontent.com',
    iosBundleId: 'com.sigma.vpn2',
  );
}