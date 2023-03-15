import 'package:flutter/material.dart';
import 'package:project2/authorization/Check.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Movigo());
}


class Movigo extends StatelessWidget {
  const Movigo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieHub",
      theme: ThemeData(
        primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF09090F),
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: Check(),
    );
  }
}
