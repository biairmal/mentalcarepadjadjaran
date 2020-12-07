import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  Future<void> uploadUserInfo(userMap) async {
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
  }

  searchUserName(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .get();
  }

  Future<void> addChatRoom(chatRoomId, chatRoomMap) async {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getChats(String chatRoomId) async{
    return await FirebaseFirestore.instance
    .collection("chatrooms")
    .doc(chatRoomId)
    .collection("chats")
    .orderBy("time")
    .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) async{
    await FirebaseFirestore.instance
    .collection("chatrooms")
    .doc(chatRoomId)
    .collection("chats")
    .add(chatMessageData).catchError((e){
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async{
    return await FirebaseFirestore.instance
    .collection("chatrooms")
    .where("users", arrayContains: itIsMyName)
    .snapshots();
  }
}
