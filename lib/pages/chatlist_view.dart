import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcp/helper/layout.dart';
import 'package:mcp/widgets/navbar.dart';
import 'package:mcp/pages/chatwindow_view.dart';
import 'package:mcp/helper/constants.dart';
import 'package:mcp/services/database.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {

  DatabaseFunctions databaseFunctions = new DatabaseFunctions();
  TextEditingController searchController = new TextEditingController();
  QuerySnapshot searchResultSnapshots;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async{
    if(searchController.text.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      await databaseFunctions.getUserByUserName(searchController.text).then((snapshot){
        searchResultSnapshots = snapshot;
        print("$searchResultSnapshots");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList(){
    return haveUserSearched ? ListView.builder(
      shrinkWrap: true,
      itemCount: searchResultSnapshots.docs.length,
      itemBuilder: (context, index){
        return userTile(
          searchResultSnapshots.docs[index].data()["email"].toString(),
          searchResultSnapshots.docs[index].data()["username"].toString(),
          );
      }): Container();
  }

  // sendMessage(String userName){
  //   List<String> users = [Constants.myName,userName];

  //   String chatRoomId = getChatRoomId(Constants.myName,userName);

  //   Map<String, dynamic> chatRoom = {
  //     "users": users,
  //     "chatRoomId" : chatRoomId,
  //   };

  //   databaseFunctions.addChatRoom(chatRoom, chatRoomId);

  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) => ChatWindowPage(
  //       chatRoomId: chatRoomId,
  //     )
  //   ));

  // }

Widget userTile(String userName,String userEmail){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
              ),
              Text(
                userEmail,
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              //sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }
    getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState(){
    super.initState();
  }

  chatList() {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatWindowPage()));
        },
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.blockVertical * 11,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black),
          )),
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
                  width: SizeConfig.blockHorizontal * 80,
                  //color : Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.blockVertical,
                      ),
                      Text(
                        "Bandana Abdillah",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "You have a message",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: SizeConfig.blockVertical,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
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
        //color: Colors.red,
        child: Column(
          children: [
            SizedBox(height: 10),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: SizeConfig.screenWidth,
              //height: SizeConfig.blockVertical * 8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black),
                  )),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal : SizeConfig.blockHorizontal*20),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              initiateSearch();
                            },
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          hintText: "Search by username...",
                          //border: InputBorder.none,
                        ),
                      ),
                    ),
                    userList(),
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: ListView(
                children: <Widget>[
                  chatList(),
                  chatList(),
                  chatList(),
                  chatList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}