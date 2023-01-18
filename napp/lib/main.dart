import 'package:flutter/material.dart';
import 'Screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.orangeAccent),
    color: Colors.red,
    home: HomeScreen(title: "Top Headlines"),
  ));
}
