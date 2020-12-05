import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseFunctions{

  getUserByUserName(String username) async {
    return await FirebaseFirestore.instance.collection("users").where("username", isEqualTo: username).get();
  }

  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  //   Future<bool> addChatRoom(chatRoom, chatRoomId) async{
  //   FirebaseFirestore.instance
  //       .collection("chatRoom")
  //       .doc(chatRoomId)
  //       .set(chatRoom)
  //       .catchError((e) {
  //     print(e);
      
  //   });
  // }

  
}