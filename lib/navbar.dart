import 'package:flutter/material.dart';
import 'package:mcp/layout.dart';
import 'package:mcp/pages/chatlist_view.dart';
import 'package:mcp/pages/home_view.dart';
import 'package:mcp/pages/login_view.dart';
import 'package:mcp/pages/profile_view.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockVertical*10,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF01B0BB), Color(0xFF3181E0)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.person,
                  size: SizeConfig.blockHorizontal * 7.5,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }),
            IconButton(
                icon: Icon(
                  Icons.home,
                  size: SizeConfig.blockHorizontal * 7.5,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            IconButton(
                icon: Icon(
                  Icons.chat,
                  size: SizeConfig.blockHorizontal * 7.5,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ChatListPage()));
                }),
            IconButton(
                icon: Icon(
                  Icons.logout,
                  size: SizeConfig.blockHorizontal * 7.5,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ],
        ));
  }
}
