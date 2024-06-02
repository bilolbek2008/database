import 'package:flutter/material.dart';
import 'package:imtixon/views/screens/home_screen.dart';

void main(List<String> args) {
  runApp(Project());
}

class Project extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
