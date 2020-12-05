import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mcp/helper/layout.dart';
import 'package:mcp/widgets/navbar.dart';

class DepresiPage extends StatelessWidget {
  static Color colorTextAbu = Color(0XFF7C797A);
  static Color colorTextBiru = Color(0XFF1C7AAE);

  final Widget psikolog = Column(
    children: [
      GestureDetector(
        onTap: (){},
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 5,),
                  Text(
                    "Nama",
                    style: TextStyle(color: colorTextBiru),
                  ),
                  Text(
                    "Spesialis",
                    style: TextStyle(color: colorTextBiru),
                  ),
                  SizedBox(height: 5,),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 10)
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depresi"),
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
                  "Deepresi",
                  style: TextStyle(fontSize: 18, color: colorTextBiru),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: SizeConfig.blockHorizontal*70,
                child: Text(
                  "depresi/dep·re·si/ /déprési/ n 1 Ek keadaan perniagaan yang sukar dan lesu; 2 Psi gangguan jiwa pada seseorang yang ditandai dengan perasaan yang merosot (seperti muram, sedih, perasaan tertekan); 3 Geo daerah merosot atau tenggelam akibat terbentuknya antiklin dan sinklin pada waktu yang sama; 4 Met daerah yang bertekanan rendah;\n\nHai, sepertinya kamu sedang mengalami waktu yang berat, ya? Bila hari-harimu kamu lalui dengan kesedihan dan penuh beban. Aku pikir kamu butuh sesuatu hal yang bisa membuat harimu menjadi semakin ringan. Jangan lupa untuk rehat untuk melepas penat karena itu dibutuhkan, sangat. Bila kamu merasa depresi, kamu boleh untuk membaca narasi ini. Dengan harapannya kamu bisa berkonsultasi dan menghasilkan suatu hal yang terbaik untuk diri.\n\nMental Care Padjadjaran 2020\n“We help make your mental health better”",
                  textAlign: TextAlign.justify,),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment(-0.6, 0),
                child: Text(
                  "Daftar Psikolog",
                  style: TextStyle(fontSize: 18, color: colorTextBiru),
                ),
              ),
              SizedBox(height: 10),
              psikolog,
              psikolog,
              psikolog,
              psikolog,
              psikolog,
              psikolog,

            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
