import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcp/helper/constants.dart';
import 'package:mcp/helper/helperfunctions.dart';
import 'package:mcp/helper/layout.dart';
import 'package:mcp/services/database.dart';
import 'package:mcp/widgets/navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color colorTextAbu = Color(0XFF7C797A);
  Color colorTextBiru = Color(0XFF1C7AAE);
  bool isEditing = false;
  QuerySnapshot dataSnapshots;
  String nama, username, email, alamat, nohp, docId;
  final _formKey = GlobalKey<FormState>();

  DatabaseFunctions databaseFunctions = new DatabaseFunctions();

  TextEditingController namaController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController nohpController = new TextEditingController();

  @override
  void initState() {
    readData();
    super.initState();
  }

  readData() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    await databaseFunctions.searchUserName(Constants.myName).then((data) {
      dataSnapshots = data;
      print("$dataSnapshots");
      setState(() {
        nama = dataSnapshots.docs[0].data()["nama"];
        namaController.text = dataSnapshots.docs[0].data()["nama"];
        username = dataSnapshots.docs[0].data()["username"];
        usernameController.text = dataSnapshots.docs[0].data()["username"];
        email = dataSnapshots.docs[0].data()["email"];
        emailController.text = dataSnapshots.docs[0].data()["email"];
        alamat = dataSnapshots.docs[0].data()["alamat"];
        alamatController.text = dataSnapshots.docs[0].data()["alamat"];
        nohp = dataSnapshots.docs[0].data()["nohp"];
        nohpController.text = dataSnapshots.docs[0].data()["nohp"];
        docId = dataSnapshots.docs[0].id;
      });
    });
  }

  void submitNewData(){
    Map<String, String> userInfoMap = {
      "username": usernameController.text,
      "email": emailController.text,
      "nama": namaController.text,
      "alamat": alamatController.text,
      "nohp": nohpController.text,
    };

    databaseFunctions.updateUserInfo(userInfoMap, docId);
    isEditing = false;
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.7),
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: SizeConfig.blockHorizontal * 15,
              top: SizeConfig.blockVertical * 32,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "NAMA",
                          style: TextStyle(color: colorTextAbu, fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        !isEditing
                            ? Text(
                                nama.toString(),
                                style:
                                    TextStyle(color: colorTextBiru, fontSize: 18),
                              )
                            : Container(
                                height: SizeConfig.blockVertical * 4,
                                width: SizeConfig.blockHorizontal * 70,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: namaController,
                                  decoration: InputDecoration(
                                    hintText: nama,
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "USERNAME",
                          style: TextStyle(color: colorTextAbu, fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        !isEditing
                            ? Text(
                                username.toString(),
                                style:
                                    TextStyle(color: colorTextBiru, fontSize: 18),
                              )
                            : Container(
                                height: SizeConfig.blockVertical * 4,
                                width: SizeConfig.blockHorizontal * 70,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                    hintText: username,
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "E-MAIL",
                          style: TextStyle(color: colorTextAbu, fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        !isEditing
                            ? Text(
                                email.toString(),
                                style:
                                    TextStyle(color: colorTextBiru, fontSize: 18),
                              )
                            : Container(
                                height: SizeConfig.blockVertical * 4,
                                width: SizeConfig.blockHorizontal * 70,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: email,
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ALAMAT",
                          style: TextStyle(color: colorTextAbu, fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        !isEditing
                            ? Text(
                                alamat.toString(),
                                style:
                                    TextStyle(color: colorTextBiru, fontSize: 18),
                              )
                            : Container(
                                height: SizeConfig.blockVertical * 4,
                                width: SizeConfig.blockHorizontal * 70,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: alamatController,
                                  decoration: InputDecoration(
                                    hintText: alamat,
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "NO. HANDPHONE",
                          style: TextStyle(color: colorTextAbu, fontSize: 10),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        !isEditing
                            ? Text(
                                nohp.toString(),
                                style:
                                    TextStyle(color: colorTextBiru, fontSize: 18),
                              )
                            : Container(
                                height: SizeConfig.blockVertical * 4,
                                width: SizeConfig.blockHorizontal * 70,
                                //color: Colors.red,
                                child: TextFormField(
                                  controller: nohpController,
                                  decoration: InputDecoration(
                                    hintText: nohp,
                                    hintStyle: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Container(
                          color: colorTextBiru,
                          child: SizedBox(
                            height: SizeConfig.blockVertical * 4,
                            width: SizeConfig.blockHorizontal * 27,
                            child: RaisedButton(
                                child: Text(
                                  isEditing ? "CANCEL" : "EDIT PROFILE",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isEditing = !isEditing;
                                  });
                                }),
                          ),
                        ),
                        SizedBox(width: 10),
                        isEditing
                            ? Container(
                                color: colorTextBiru,
                                child: SizedBox(
                                  height: SizeConfig.blockVertical * 4,
                                  width: SizeConfig.blockHorizontal * 27,
                                  child: RaisedButton(
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          submitNewData();
                                        });
                                      }),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
