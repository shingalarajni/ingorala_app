import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingorala_app/Screens/LoginPage.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Contact"),
      ),
    );
  }
}
