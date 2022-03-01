import 'package:acareai/blog%20views/home.dart';
import 'package:acareai/home/welcome.dart';
import 'package:acareai/messenger/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/home_view.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Care App',
      theme: ThemeData.dark(),
      home:   Welcome(),
    );
      
  }
}

