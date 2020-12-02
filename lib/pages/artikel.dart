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
                alignment: Alignment(0, 0),
                child: Container(
                  width: SizeConfig.screenWidth*0.8,
                  child: Text(
                    "Mengenal Zoom Fatigue Syndrome, Kelelahan Akut Akibat Terlalu Sering Meeting di Zoom",
                    style: TextStyle(fontSize: 18, color: colorTextBiru),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: SizeConfig.blockHorizontal*70,
                child: Text("Tahun 2020 ini melelahkan bukan? Berbagai persoalan kita lalui di tahun ini. Perubahan gaya hidup untuk menyesuaikan diri di kala pandemi tentu bukan hal yang mudah. Kuliah online, work from home, dan segala sesuatu harus dilakukan dari rumah. Apakah hal yang dilakukan dari rumah itu menjadi lebih mudah? Mungkin mengerjakan hal dari rumah terlihat lebih mudah karena kita tidak perlu mengeluarkan energi lebih untuk beraktivitas di luar. Namun, ternyata ada yang dinamakan Zoom fatique Syndrome lho.\n\nDilansir dari Kompas, penjelasan mengenai Zoom fatique Syndrome dapat kita temui dalam wawancara BBC Worklife dengan Gianpiero Petriglieri, seorang profesor di Insead dan Marissa Shuffler, seorang profesor di Universitas Clemson. Menurut Petriglieri, panggilan video membuat kita perlu lebih banyak fokus dibandingkan obrolan tatap muka. Video call ini membuat kita bekerja lebih keras untuk memproses isyarat nonverbal, seperti nada suara, ekspresi wajah, juga bahasa tubuh. Ini menuntut kita untuk lebih fokus. Hal ini juga membuat kita mengeluarkan lebih banyak energi.\n\nKalau kamu merasa lelah ketika melaksanakan kuliah online, rapat online, atau apapun yang berhubungan dengan video call ini, bisa jadi kamu mengalami Zoom fatique Syndrome. Hmm, ternyata melakukan seluruh aktivitas dari rumah saja tidak semudah itu ya. Kita memang tidak perlu untuk pergi ke luar rumah, mengeluarkan biaya makan di luar, menggunakan transportasi umum, dan lainnya. Namun, aktivitas langsung di luar rumah sepertinya memang tak kan terganti.\nUntukmu yang sekarang sedang berjuang, berhadapan dengan laptop atau ponselmu dari pagi hingga malam, kamu hebat. Jangan lupa untuk istirahat ya, jangan memaksakan diri kamu untuk dapat melakukan segalanya. Dalam hidup kita ini ada dua, yaitu apa yang kita punya dan apa yang kita tidak punya. So, nggak perlu sempurna dalam melakukan semua hal kok.\n\nIngat, kamu juga perlu istirahat. Menghilang satu atau dua hari untuk istirahat wajar banget! Kamu mungkin punya tanggung jawab yang banyak di luar sana, tapi ingat jika kamu juga punya tanggung jawab atas diri kamu sendiri. Kebahagianmu adalah tanggung jawabmu karena tidak ada satu orang pun yang bisa bertanggung jawab atas hal itu. Istirahatlah sebentar, tenangkan diri, lalu bangkit dan lalukan yang terbaik. Mulai sekarang, kalau kamu sudah merasa overwhelmed, jangan paksa diri kamu untuk melanjutkan sesuatu ya. Berusahalah untuk mengerti keadaan diri sendiri. Mengapa harus begitu? Cause we’re only human.\n\n\nArtikel asli dari “Mengenal Zoom Fatigue Syndrome, Kelelahan Akut Akibat Terlalu Sering Meeting di Zoom” oleh Deandra Salsabilam\nhttps://www.hipwee.com/narasi\njangan-terus-memaksakan-diri-waktunya-kamu-take-a-rest-then-do-the-best/.",
                textAlign: TextAlign.justify,),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
        //a
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
