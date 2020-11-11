import 'package:flutter/material.dart';
import 'package:mcp/navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF01B0BB), Color(0xFF3181E0)])),
        ),
      ),
      body: Center(child : Text("Home")),
      bottomNavigationBar: NavBar(),
    );
  }
}
