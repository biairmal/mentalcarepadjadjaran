import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcp/helper/layout.dart';
import 'package:mcp/helper/constants.dart';
import "package:mcp/helper/helperfunctions.dart";
import 'package:mcp/services/database.dart';

class ChatWindowPage extends StatefulWidget {
  final String chatRoomId;

  ChatWindowPage({this.chatRoomId});

  @override
  _ChatWindowPageState createState() => _ChatWindowPageState();
}

class _ChatWindowPageState extends State<ChatWindowPage> {
  //static Color colorTextAbu = Color(0XFF7C797A);
  //static Color colorTextBiru = Color(0XFF1C7AAE);

  Stream<QuerySnapshot> chats;
  TextEditingController messageControrller = new TextEditingController();

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data.documents[index].data()["message"],
                    sendByMe: Constants.myName ==
                        snapshot.data.documents[index].data()["sendBy"],
                  );
                })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageControrller.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": Constants.myName,
        "message": messageControrller.text,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseFunctions().addMessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageControrller.text = "";
      });
    }
  }

  @override
  void initState() {
    DatabaseFunctions().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 10),
            Text("Chat"),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF01B0BB), Color(0xFF3181E0)])),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  //color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      chatMessages(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockVertical * 11,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: SizeConfig.screenWidth * 0.95,
                        height: SizeConfig.blockVertical * 7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          controller: messageControrller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tulis pesan...",
                              hintStyle: TextStyle(color: Colors.black38)),
                        )),
                  ),
                  Align(
                    alignment: Alignment(0.9, 0),
                    child: GestureDetector(
                      child: Container(
                        width: SizeConfig.blockHorizontal * 7,
                        height: SizeConfig.blockHorizontal * 7,
                        child: Icon(
                          Icons.send,
                          size: SizeConfig.blockHorizontal * 6.5,
                          color: Colors.blueGrey[300],
                        ),
                      ),
                      onTap: () {
                        addMessage();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  static Color colorTextBiru = Color(0XFF1C7AAE);

  MessageTile({@required this.message, @required this.sendByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: sendByMe ? 0 : 24,
            right: sendByMe ? 24 : 0),
        alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: sendByMe
            ? Container(
                margin: EdgeInsets.only(left: 30),
                padding:
                    EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: colorTextBiru),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Text(message),
              )
            : Row(
                children: [
                  Container(
                    width: SizeConfig.blockVertical * 7,
                    height: SizeConfig.blockVertical * 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(
                        top: 17, bottom: 17, left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: colorTextBiru),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Text(message),
                  ),
                ],
              ));
  }
}
