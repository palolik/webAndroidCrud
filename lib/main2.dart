// this one is for running the code in websitee phone

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCSHoJMirJ455KMr6kdB4hTvxbIxrzt6pw",
      projectId: "crudmain-c9f58",
      messagingSenderId: "162527355283",
      appId: "1:162527355283:web:db6bceff7669e1bf454866",
    ),
  );
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          // ignore: avoid_print
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Firestore CRUD',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
