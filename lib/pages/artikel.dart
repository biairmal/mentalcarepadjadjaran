import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mcp/layout.dart';
import 'package:mcp/navbar.dart';

class ArtikelPage extends StatelessWidget {
  static Color colorTextAbu = Color(0XFF7C797A);
  static Color colorTextBiru = Color(0XFF1C7AAE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artikel"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF01B0BB), Color(0xFF3181E0)])),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          //color: Colors.blue,
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: SizeConfig.blockHorizontal * 70,
                height: SizeConfig.blockVertical * 20,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment(-0.5, 0),
                child: Text(
                  "Judul Artikel",
                  style: TextStyle(fontSize: 18, color: colorTextBiru),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: SizeConfig.blockHorizontal*70,
                child: Text("as da a  a dsa as sa"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
