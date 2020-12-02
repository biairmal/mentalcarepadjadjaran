import 'package:flutter/material.dart';
import 'package:mcp/layout.dart';

class ChatWindowPage extends StatelessWidget {
  static Color colorTextAbu = Color(0XFF7C797A);
  static Color colorTextBiru = Color(0XFF1C7AAE);

  chat(String type){
    if(type == "receive"){
      return Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: SizeConfig.blockVertical * 5,
                                height: SizeConfig.blockVertical * 5,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: SizeConfig.screenWidth * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: colorTextBiru, width: 1.5),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Text(
                                    "COBA in imah testing aja seberapa banyak dia bisa  melakukan semuanya"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Jam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
    }
    else if(type == "send"){
      return Container(
                      //color: Colors.green,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "R",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                  Text(
                                    "Jam",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: SizeConfig.screenWidth * 0.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: colorTextBiru, width: 1.5),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Text(
                                    "Ini ketika anda mengirimkan sesuatu, pokoknya mah jadinya gini lah ya"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
    }
  }
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
                      chat("receive"),
                      chat("send"),
                      chat("receive"),
                      chat("receive"),
                      chat("send"),
                      chat("send"),
                      chat("send"),
                      
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
                        height: SizeConfig.blockVertical *7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tulis pesan...",
                              hintStyle: TextStyle(color: Colors.black38)),
                        )),
                  ),
                  Align(
                    alignment: Alignment(0.9,0),
                      child: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: SizeConfig.blockHorizontal * 7.5,
                            color: Colors.blueGrey[300],
                          ),
                          onPressed: () {}))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
