import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard.dart';
import 'loginform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC7A9XRkH0DS1fHvnmhoxyNATw5nrX-g-k",
            authDomain: "ionapp-99f56.firebaseapp.com",
            projectId: "ionapp-99f56",
            storageBucket: "ionapp-99f56.appspot.com",
            messagingSenderId: "721672712800",
            appId: "1:721672712800:web:a7b36a4530617c06bbc905",
            measurementId: "G-9ZTMDRV2LM"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
