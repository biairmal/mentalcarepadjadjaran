import 'package:flutter/material.dart';
import 'package:mcp/layout.dart';
import 'package:mcp/navbar.dart';
import 'package:mcp/pages/artikel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Color colorTextAbu = Color(0XFF7C797A);
  static Color colorTextBiru = Color(0XFF1C7AAE);

  menuButton(kata){

  return Container(
    //color: Colors.blue
    decoration:
        BoxDecoration(border: Border.all(color: colorTextBiru, width: 1,)),
    height: SizeConfig.blockVertical * 22,
    width: SizeConfig.blockHorizontal * 28,
    child: Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: SizeConfig.blockVertical * 10,
          width: SizeConfig.blockHorizontal * 18,
          decoration: BoxDecoration(color: colorTextAbu, borderRadius : BorderRadius.circular(5)),
        ),
        SizedBox(height: 20),
        Text(
          kata,
          style: TextStyle(color: colorTextBiru),
        ),
      ],
    ),
  );
  } 

  artikel(judul){
    
  return Column(
    children: [
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ArtikelPage()));
        },
        child: Container(
          //color: Colors.red,
          width: SizeConfig.blockHorizontal * 70,
          height: SizeConfig.blockVertical * 9,
          decoration: BoxDecoration(
            //color: Colors.red,
            border: Border.all(
              color: colorTextBiru,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              SizedBox(width: 8),
              Container(
                width: SizeConfig.blockHorizontal * 10,
                height: SizeConfig.blockHorizontal * 10,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(6)),
              ),
              SizedBox(width: 10),
              Text(
                judul,
                style: TextStyle(color: colorTextBiru),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 10)
    ],
  );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF01B0BB), Color(0xFF3181E0)])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton("Depresi"),
                menuButton("Stress"),
                menuButton("Curhat"),

              ],
            ),
            SizedBox(height: 30),
            Container(
              //color: Colors.blue,
              width: SizeConfig.blockHorizontal * 70,
              height: SizeConfig.blockVertical * 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tahu gak sih?", style : TextStyle(color : colorTextBiru)),
                  SizedBox(height: 7,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(color : Colors.grey, borderRadius : BorderRadius.circular(10)),
                        child: Text("Kesehatan Mental", style : TextStyle(color : colorTextBiru)),
                      ),
                      SizedBox(width : 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(color : Colors.grey, borderRadius : BorderRadius.circular(10)),
                        child: Text("Makanan", style : TextStyle(color : colorTextBiru)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            artikel("Judul Artikel 1"),
            artikel("Judul Artikel 2"),
            artikel("Judul Artikel 3"),
            artikel("Judul Artikel 4"),
            artikel("Judul Artikel 5"),
            artikel("Judul Artikel 6"),
            
            ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
