import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_of_breakfast/model/breakfast.dart';

class DetailMenuPage extends StatelessWidget {
  final Breakfast breakfast;
  const DetailMenuPage({Key? key, required this.breakfast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    child: Text(
                      breakfast.title,
                      style: GoogleFonts.lexend(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
      // alignment: Alignment.center,
      child: Text(
        breakfast.desc,
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

    Widget bagianGambar = (breakfast.image != null)
    ? Image.network(
      breakfast.image,
      width: 600,
      fit: BoxFit.cover,
    )
    : Image.asset(
      'asset/Gambar-tidak-tersedia.png',
      width: 600,
      fit: BoxFit.cover,
    );

    List<String>? itemBahan = breakfast.ingredient;
    Widget bagianBahan = Column(
      children: [
        SizedBox(height: 40),
        Text(
          "Ingredients",
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
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
                textAlign: TextAlign.justify,
              ),
            );
          }).toList(),
        ),
      ],
    );

    List<String>? itemTahap = breakfast.step;
    Widget bagianTahap = Column(
      children: [
        SizedBox(height: 40),
        Text(
          "Instructions",
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
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
                textAlign: TextAlign.justify,
              ),
            );
          }).toList(),
        ),
      ],
    );

    Container(
      alignment: Alignment.centerLeft,
      height: 60,
      width: 370,
      margin: EdgeInsets.only(top: 0),
      child: TextFormField(
        onChanged: (value) {
          setState:
          (() {});
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_rounded),
          hintText: 'Search',
          isDense: true,
          hintStyle: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Color(0xff87A8A1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff87A8A1)),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff87A8A1)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );

    Widget bagianProtein = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(height: 16),
            Text(
              breakfast.kalori,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Color(0xff87A8A1),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: 16),
            Text(
              breakfast.karbo,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Color(0xff87A8A1),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: 16),
            Text(
              breakfast.protein,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Color(0xff87A8A1),
              ),
            ),
          ],
        ),
      ],
    );

    Widget bagianServe = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              breakfast.serve,
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              breakfast.minute,
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          breakfast.title,
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff87A8A1),
      ),

      body: ListView(
        children: <Widget>[
          bagianGambar,
          bagianJudul,
          bagianServe,
          bagianProtein,
          bagianDeskripsi,
          bagianBahan,
          bagianTahap,
        ],
      ),
    );
  }
}
