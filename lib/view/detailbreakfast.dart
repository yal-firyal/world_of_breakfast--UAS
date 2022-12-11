import 'dart:html';

import 'package:flutter/material.dart';
import 'package:world_of_breakfast/model/breakfast.dart';
import 'package:world_of_breakfast/model/detailbreakfast.dart';
import 'package:world_of_breakfast/viewmodel/fetchdetailbreakfast.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.breakfast}) : super(key: key);
  final Breakfast breakfast;

  @override
  Widget build(BuildContext context) {
    String judul = breakfast.key;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Easy to Cook',
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff87A8A1),
      ),

      body: FutureBuilder<DetailMasak>(
        future: fetchDetailMasak(judul),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                'Still Loading...',
                style: GoogleFonts.lexend(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
              //error
              if (snapshot.hasError) {
                Center(
                  child: Text(
                    'Error: ${snapshot.error.toString()}',
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                );
              }
              return snapshot.hasData
              ? TampilCaraMasak(datadetailmasak: snapshot.data)
              : const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}

class TampilCaraMasak extends StatelessWidget {
  const TampilCaraMasak({Key? key, required this.datadetailmasak}) : super(key: key);
  final DetailMasak? datadetailmasak;
  final bool? gambar = true;

  @override
  Widget build(BuildContext context) {
    //widget bagian judul
    Widget bagianJudul = Container(
      margin: const EdgeInsets.fromLTRB(61, 24, 61, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    datadetailmasak!.breakfasts.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Calories : ${datadetailmasak!.breakfasts.kalori}',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Carbohydrates : ${datadetailmasak!.breakfasts.karbo}',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Protein : ${datadetailmasak!.breakfasts.protein}',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Servings : ${datadetailmasak!.breakfasts.serve}',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Total : ${datadetailmasak!.breakfasts.minute}',
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    //widget bagian deskripsi
    Widget bagianDeskripsi = Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(23, 16, 23, 0),
      child: Text(
        datadetailmasak!.breakfasts.desc,
        textAlign: TextAlign.justify,
        style: GoogleFonts.lexend(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: Colors.black,
        ),
        softWrap: true,
      ),
    );

    //widget bagian gambar
    Widget bagianGambar = (datadetailmasak!.breakfasts.image != null)
      ? Image.network(
          datadetailmasak!.breakfasts.image,
          width: 600,
          fit: BoxFit.cover,
        )
      : Image.asset(
          'asset/Gambar-tidak-tersedia.png',
          width: 600,
          fit: BoxFit.cover,
    );

    //widget bagian ingredients
    List<String>? itemBahan = datadetailmasak!.breakfasts.ingredient;
    Widget bagianBahan = Column(
      children: [
        Text(
          'Ingredients',
          // textAlign: TextAlign.start,
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        Column(
          children: itemBahan.map((bahan) {
            return ListTile(
              title: Text(
                bahan,
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );

    //widget bagian cooking
    List<String>? itemTahap = datadetailmasak!.breakfasts.step;
    Widget bagianTahap = Column(
      children: [
        Text(
          'Instructions',
          // textAlign: TextAlign.start,
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        Column(
          children: itemTahap.map((cara) {
            return ListTile(
              title: Text(
                cara,
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          bagianGambar,
          bagianJudul,
          bagianDeskripsi,
          bagianBahan,
          bagianTahap,
        ],
      ),
    );
  }
}

