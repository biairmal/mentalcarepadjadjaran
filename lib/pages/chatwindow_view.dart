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

  // chat(String type){
  //   if(type == "receive"){
  //     return Container(
  //                     //color: Colors.green,
  //                     child: Column(
  //                       children: [
  //                         SizedBox(height: 10),
  //                         Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             SizedBox(
  //                               width: 20,
  //                             ),
  //                             Container(
  //                               width: SizeConfig.blockVertical * 5,
  //                               height: SizeConfig.blockVertical * 5,
  //                               decoration: BoxDecoration(
  //                                 color: Colors.amber,
  //                                 shape: BoxShape.circle,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 20,
  //                             ),
  //                             Container(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 10, vertical: 10),
  //                               width: SizeConfig.screenWidth * 0.6,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.white,
  //                                   border: Border.all(
  //                                       color: colorTextBiru, width: 1.5),
  //                                   borderRadius: BorderRadius.only(
  //                                       topRight: Radius.circular(15),
  //                                       bottomLeft: Radius.circular(15),
  //                                       bottomRight: Radius.circular(15))),
  //                               child: Text(
  //                                   "COBA in imah testing aja seberapa banyak dia bisa  melakukan semuanya"),
  //                             ),
  //                             SizedBox(
  //                               width: 5,
  //                             ),
  //                             Text(
  //                               "Jam",
  //                               style: TextStyle(
  //                                   fontSize: 12, color: Colors.black54),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: 10),
  //                       ],
  //                     ),
  //                   );
  //   }
  //   else if(type == "send"){
  //     return Container(
  //                     //color: Colors.green,
  //                     child: Column(
  //                       children: [
  //                         SizedBox(height: 10),
  //                         Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.end,
  //                           children: [
  //                             Column(
  //                               children: [
  //                                 Text(
  //                                   "R",
  //                                   style: TextStyle(
  //                                       fontSize: 12, color: Colors.black54),
  //                                 ),
  //                                 Text(
  //                                   "Jam",
  //                                   style: TextStyle(
  //                                       fontSize: 12, color: Colors.black54),
  //                                 ),
  //                               ],
  //                             ),
  //                             SizedBox(
  //                               width: 5,
  //                             ),
  //                             Container(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 10, vertical: 10),
  //                               width: SizeConfig.screenWidth * 0.6,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.white,
  //                                   border: Border.all(
  //                                       color: colorTextBiru, width: 1.5),
  //                                   borderRadius: BorderRadius.only(
  //                                       topLeft: Radius.circular(15),
  //                                       bottomLeft: Radius.circular(15),
  //                                       bottomRight: Radius.circular(15))),
  //                               child: Text(
  //                                   "Ini ketika anda mengirimkan sesuatu, pokoknya mah jadinya gini lah ya"),
  //                             ),
  //                             SizedBox(
  //                               width: 20,
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: 20),
  //                       ],
  //                     ),
  //                   );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: SizeConfig.blockVertical * 5,
              height: SizeConfig.blockVertical * 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
            ),
            SizedBox(width: 10),
            Text("Bandana"),
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
                        width: SizeConfig.blockHorizontal*7,
                        height: SizeConfig.blockHorizontal*7,
                        child: Icon(
                          Icons.send,
                          size: SizeConfig.blockHorizontal * 6.5,
                          color: Colors.blueGrey[300],
                        ),
                      ),
                      onTap: (){
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

  MessageTile({@required this.message, @required this.sendByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe
                  ? [const Color(0xff007EF4), const Color(0xff2A75BC)]
                  : [const Color(0x1AFFFFFF), const Color(0x1AFFFFFF)],
            )),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
