import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:mcp/home_view.dart';
import 'package:mcp/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:mcp/pages/home_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int resizeBox = 0;
  String kata1 = 'Belum punya akun?   ';
  String kata2 = 'Daftar';
  String kata3 = 'Login';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final List<Widget> swiperlist = [
      Container(
        //color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.7),
              child: Text(
                "MENTAL CARE PADJADJARAN",
                style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Roboto',
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
                alignment: Alignment(0, 0.4),
                child: Container(
                  //color : Colors.white,
                  width: SizeConfig.blockHorizontal * 55,
                  height: SizeConfig.blockVertical * 30,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, ",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,),
                ))
          ],
        ),
      ),
      Container(
        //color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.7),
              child: Text(
                "IMBAUAN",
                style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Roboto',
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
                alignment: Alignment(0, 0.4),
                child: Container(
                  //color : Colors.white,
                  width: SizeConfig.blockHorizontal * 55,
                  height: SizeConfig.blockVertical * 30,
                  child: Text(
                      "Semua hal yang ada di sini hanyalah uji coba, jangan suka main main ah ga baik. Siap teman teman?",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,),
                ))
          ],
        ),
      ),
      
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Text Deskripsi Aplikasi
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.blockVertical * 47,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return swiperlist[index];
                    },
                    itemCount: 2,
                    pagination: new SwiperPagination(),
                    //control: new SwiperControl(),
                  ))),

          // Container Login
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              //color: Colors.grey,
              width: SizeConfig.screenWidth,
              height: SizeConfig.blockVertical * (53 + resizeBox),
              child: Stack(
                children: <Widget>[
                  // Box Biru
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 200),
                      height: (SizeConfig.blockVertical * (53 + resizeBox)) -
                          (SizeConfig.blockVertical * 8),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF01B0BB), Color(0xFF3181E0)]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                    ),
                  ),
                  // Logo MCP
                  Align(
                    alignment: Alignment(0, -1),
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      //color: Colors.white,
                      duration: Duration(milliseconds: 200),
                      child: Image.asset(
                        "assets/images/logo_putih.png",
                        width: SizeConfig.blockHorizontal * 25,
                      ),
                    ),
                  ),
                  // Klik daftar

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: SizeConfig.screenWidth / 2,
                                height: SizeConfig.blockVertical * 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    border: InputBorder.none,
                                    hintText: "Username",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: SizeConfig.screenWidth / 2,
                                height: SizeConfig.blockVertical * 6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    border: InputBorder.none,
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                              width: SizeConfig.screenWidth / 2,
                              child: RaisedButton(
                                  child: Text(kata3),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  })),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: kata1,
                                style: TextStyle(color: Colors.amber),
                              ),
                              TextSpan(
                                  text: kata2,
                                  style: TextStyle(
                                      color: Colors.amber,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _clickDaftar();
                                    }),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clickDaftar() {
    setState(() {
      if (resizeBox == 0) {
        resizeBox += 14;
        kata1 = 'Sudah punya akun?   ';
        kata2 = 'Login';
        kata3 = 'Daftar';
      } else {
        resizeBox = 0;
        kata1 = 'Belum punya akun?   ';
        kata2 = 'Daftar';
        kata3 = 'Login';
      }
    });
  }
}
