import 'package:flutter/material.dart';
import 'package:treatacard_web_app/splash.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const Splash()));
}
