import 'package:flutter/material.dart';
import 'package:mcp/pages/splashscreen_view.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.blue, buttonColor: Color(0xFFE0AD42)),
      home: SplashScreenPage(),
    ));
}

