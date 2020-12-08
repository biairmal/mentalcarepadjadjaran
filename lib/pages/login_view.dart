import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcp/helper/helperfunctions.dart';
import 'package:mcp/helper/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:mcp/services/auth_services.dart';
import 'package:mcp/services/database.dart';
import 'package:mcp/pages/home_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  AuthServices authService = new AuthServices();
  DatabaseFunctions databaseFunctions = new DatabaseFunctions();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isDaftar = false;

  int resizeBox = 0;
  String kata1 = 'Belum punya akun?   ';
  String kata2 = 'Daftar';
  String kata3 = 'Login';

  signUpOrLogin() async {
    Map<String, String> userInfoMap = {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "nama": "",
      "alamat": "",
      "nohp": "",
    };

    if (isDaftar == true) {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        await authService
            .signUpWithmailAndPassword(
                emailController.text, passwordController.text)
            .then((val) async {
          if (val != null) {
            print("$val");

            databaseFunctions.uploadUserInfo(userInfoMap);
            HelperFunctions.saveUserLoggedInSharedPreference(true);
            HelperFunctions.saveUserNameSharedPreference(
                usernameController.text);
            HelperFunctions.saveUserEmailSharedPreference(emailController.text);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      }
    } else {
      if (_formKey.currentState.validate()) {
        setState(() {
          isLoading = true;
        });
        await authService
            .signInWithEmailAndPassword(
                emailController.text, passwordController.text)
            .then((val) async {
          print("$val");
          if (val != null) {
            QuerySnapshot userInfoSnapshot =
                await DatabaseFunctions().getUserInfo(emailController.text);

            HelperFunctions.saveUserLoggedInSharedPreference(true);
            HelperFunctions.saveUserNameSharedPreference(
                userInfoSnapshot.docs[0].data()["username"]);
            HelperFunctions.saveUserEmailSharedPreference(
                userInfoSnapshot.docs[0].data()["email"]);

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      }
    }
    HelperFunctions.saveUserLoggedInSharedPreference(true);
  }

  formLogin() {
    if (isDaftar == true) {
      return AnimatedContainer(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (val) {
                        return val.length > 6
                            ? null
                            : "Enter Username 6+ characters";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) {
                        return val.length > 6
                            ? null
                            : "Enter Password 6+ characters";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )));
    } else {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 70),
          //color: Colors.white,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) {
                        return val.length > 6
                            ? null
                            : "Enter Password 6+ characters";
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final List<Widget> swiperlist = [
      Container(
        //color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.6),
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
                alignment: Alignment(0, 0.65),
                child: Container(
                  //color : Colors.white,
                  width: SizeConfig.blockHorizontal * 55,
                  height: SizeConfig.blockVertical * 30,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, ",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ))
          ],
        ),
      ),
      Container(
        //color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.6),
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
                alignment: Alignment(0, 0.65),
                child: Container(
                  //color : Colors.white,
                  width: SizeConfig.blockHorizontal * 55,
                  height: SizeConfig.blockVertical * 30,
                  child: Text(
                    "Semua hal yang ada di sini hanyalah uji coba, jangan suka main main ah ga baik. Siap teman teman?",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ))
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Stack(
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
                          pagination: new SwiperPagination(
                              builder: const DotSwiperPaginationBuilder(
                                  size: 5.0,
                                  activeColor: Colors.blue,
                                  color: Colors.lightBlue,
                                  space: 5.0,
                                  activeSize: 7.0)),
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
                            height:
                                (SizeConfig.blockVertical * (53 + resizeBox)) -
                                    (SizeConfig.blockVertical * 8),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF01B0BB),
                                      Color(0xFF3181E0)
                                    ]),
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
                                  child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 200),
                                child: formLogin(),
                              )),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: SizedBox(
                                    width: SizeConfig.screenWidth / 2,
                                    child: RaisedButton(
                                        child: Text(kata3),
                                        onPressed: () {
                                          signUpOrLogin();
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
                                            decoration:
                                                TextDecoration.underline),
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
      if (isDaftar == false) {
        resizeBox += 7;
        kata1 = 'Sudah punya akun?   ';
        kata2 = 'Login';
        kata3 = 'Daftar';
        isDaftar = true;
        emailController = TextEditingController(text: "");
        passwordController = TextEditingController(text: "");
      } else {
        resizeBox = 0;
        kata1 = 'Belum punya akun?   ';
        kata2 = 'Daftar';
        kata3 = 'Login';
        isDaftar = false;
        emailController = TextEditingController(text: "");
        passwordController = TextEditingController(text: "");
      }
    });
  }
}
