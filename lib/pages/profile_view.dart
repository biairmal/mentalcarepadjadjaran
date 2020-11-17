import 'package:flutter/material.dart';
import 'package:mcp/layout.dart';
import 'package:mcp/navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color colorTextAbu = Color(0XFF7C797A);
  Color colorTextBiru = Color(0XFF1C7AAE);

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
                      Text(
                        "Jajang Hermansyah",
                        style: TextStyle(color: colorTextBiru, fontSize: 18),
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
                      Text(
                        "jajanggantengmax",
                        style: TextStyle(color: colorTextBiru, fontSize: 18),
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
                      Text(
                        "jajanguntukmu@gmail.com",
                        style: TextStyle(color: colorTextBiru, fontSize: 18),
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
                      Text(
                        "Jl. Kenangan nomor 14",
                        style: TextStyle(color: colorTextBiru, fontSize: 18),
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
                      Text(
                        "081234567890",
                        style: TextStyle(color: colorTextBiru, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    color: colorTextBiru,
                    child: SizedBox(
                      height: SizeConfig.blockVertical * 4,
                      width: SizeConfig.blockHorizontal * 27,
                      child: RaisedButton(
                          child: Text(
                            "EDIT PROFILE",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          onPressed: null),
                    ),
                  )
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
