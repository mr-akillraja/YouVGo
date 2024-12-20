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
    apiKey: 'AIzaSyDKyLF1znSSn6_jirWtY4HXK09IsuLoZQ8',
    appId: '1:996922060890:web:4e0b93cb0c24f75946e863',
    messagingSenderId: '996922060890',
    projectId: 'youvgo-db4b9',
    authDomain: 'youvgo-db4b9.firebaseapp.com',
    storageBucket: 'youvgo-db4b9.firebasestorage.app',
    measurementId: 'G-SGNBNE62ZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaxwK7FttCBSWTIM9E_SdDgGJiIxFvdPI',
    appId: '1:996922060890:android:33969cf117c699a646e863',
    messagingSenderId: '996922060890',
    projectId: 'youvgo-db4b9',
    storageBucket: 'youvgo-db4b9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2KMQmlSuYxGwzCpslkJaJKbuLQbkVAmA',
    appId: '1:996922060890:ios:fe480b8f521dd90046e863',
    messagingSenderId: '996922060890',
    projectId: 'youvgo-db4b9',
    storageBucket: 'youvgo-db4b9.firebasestorage.app',
    iosBundleId: 'com.example.youvgo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2KMQmlSuYxGwzCpslkJaJKbuLQbkVAmA',
    appId: '1:996922060890:ios:fe480b8f521dd90046e863',
    messagingSenderId: '996922060890',
    projectId: 'youvgo-db4b9',
    storageBucket: 'youvgo-db4b9.firebasestorage.app',
    iosBundleId: 'com.example.youvgo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKyLF1znSSn6_jirWtY4HXK09IsuLoZQ8',
    appId: '1:996922060890:web:105826ccd738bbef46e863',
    messagingSenderId: '996922060890',
    projectId: 'youvgo-db4b9',
    authDomain: 'youvgo-db4b9.firebaseapp.com',
    storageBucket: 'youvgo-db4b9.firebasestorage.app',
    measurementId: 'G-NCVD3WT77G',
  );

}