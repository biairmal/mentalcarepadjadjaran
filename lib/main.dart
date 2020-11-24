import 'package:flutter/material.dart';
import 'package:mcp/pages/splashscreen_view.dart';
import 'package:mcp/pages/home_view.dart';
import 'package:mcp/pages/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        buttonColor: Color(0xFFE0AD42)),
    home: SplashScreenPage(),
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          }
          return LoginPage();
        });
  }
}
