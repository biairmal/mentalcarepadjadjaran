import 'package:flutter/material.dart';
import 'package:mcp/navbar.dart';
import 'package:mcp/layout.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  Widget chatList = Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.blockVertical * 11,
        decoration: BoxDecoration(border : Border(bottom: BorderSide(width: 0.5, color: Colors.black),)),
        child: Stack(
          children: <Widget>[
            // Foto Profil
            Align(
              alignment: Alignment(-0.9, 0),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Text chatlist
            Align(
              alignment: Alignment(1, -0.4),
              child: Container(
                width: SizeConfig.blockHorizontal*80,
                //color : Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.blockVertical,),
                    Text(
                      "Bandana Abdillah",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "You have a message",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: SizeConfig.blockVertical,),
                  ],
                ),
              ),
            ),

          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      body: ListView(
        children: <Widget>[
          chatList,
          chatList,
          chatList,
          chatList,
          chatList,
          chatList,
          chatList,
          chatList,
          chatList,

      ],),
      bottomNavigationBar: NavBar(),
    );
  }
}
