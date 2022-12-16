import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_of_breakfast/model/breakfast.dart';
import 'package:world_of_breakfast/service/breakfast_service.dart';
import 'package:world_of_breakfast/view/search.dart';
// import 'package:provider/provider.dart';
// import 'package:world_of_breakfast/theme.dart';
import 'package:world_of_breakfast/view/detailmenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'HOME',
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        // actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.brightness_6),
          //   color: Colors.white,
          //   onPressed: () {
          //     ThemeProvider themeProvider = Provider.of<ThemeProvider>(
          //       context,
          //       listen: false,
          //     );
          //     themeProvider.swapTheme();
          //   },
          // )
        // ],

        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: Colors.white,
        //   ),
        // ),
        centerTitle: true,
        backgroundColor: Color(0xff87A8A1),
        automaticallyImplyLeading: false,
        elevation: 1,
      ),

      body: FutureBuilder<List<Breakfast>>(
          future: BreakfastService.getDataBreakfast(),
          builder: (context, snapshot) {
            //loading
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
                return Text(snapshot.error.toString());
              } else {
                //berhasil
                // return Text(snapshot.data.toString());
                return Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 16),
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailMenuPage(breakfast: snapshot.data![index]))
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network("${snapshot.data![index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: Colors.white54,
                                  child: Text("${snapshot.data![index].title}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: double.infinity,
                                  color: Colors.white54,
                                  child: Text("${snapshot.data![index].serve} People",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lexend(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            }
          }
      ),

      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         Container(
      //           margin: const EdgeInsets.fromLTRB(24, 24, 0, 0),
      //           child: Text(
      //             "Start Your Day",
      //             textAlign: TextAlign.left,
      //             style: GoogleFonts.lexend(
      //               fontSize: 26,
      //               fontWeight: FontWeight.bold,
      //               fontStyle: FontStyle.normal,
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //
      //         Container(
      //           margin: const EdgeInsets.fromLTRB(24, 8, 0, 0),
      //           child: Text(
      //             "With Your Favorite Breakfast",
      //             textAlign: TextAlign.left,
      //             style: GoogleFonts.lexend(
      //               fontSize: 16,
      //               fontWeight: FontWeight.normal,
      //               fontStyle: FontStyle.normal,
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //
      //         Container(
      //           margin: const EdgeInsets.fromLTRB(24, 40, 0, 0),
      //           child: Text(
      //             "The Menu",
      //             textAlign: TextAlign.left,
      //             style: GoogleFonts.lexend(
      //               fontSize: 24,
      //               fontWeight: FontWeight.bold,
      //               fontStyle: FontStyle.normal,
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //
      //         Container(
      //           height: 3000,
      //           width: screenWidth,
      //           child: FutureBuilder<List<Breakfast>>(
      //               future: BreakfastService.getDataBreakfast(),
      //               builder: (context, snapshot) {
      //                 //loading
      //                 if (snapshot.connectionState == ConnectionState.waiting) {
      //                   return Center(
      //                     child: Text(
      //                       'Still Loading...',
      //                       style: GoogleFonts.lexend(
      //                         fontSize: 24,
      //                         fontWeight: FontWeight.bold,
      //                         fontStyle: FontStyle.normal,
      //                         color: Colors.black,
      //                       ),
      //                       textAlign: TextAlign.center,
      //                     ),
      //                   );
      //                 } else {
      //                   //error
      //                   if (snapshot.hasError) {
      //                     return Text(snapshot.error.toString());
      //                   } else {
      //                     //berhasil
      //                     // return Text(snapshot.data.toString());
      //                     return Padding(
      //                       padding: const EdgeInsets.only(left: 28, right: 28, top: 16),
      //                       child: GridView.builder(
      //                           itemCount: snapshot.data!.length,
      //                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                             crossAxisCount: 2,
      //                             crossAxisSpacing: 16,
      //                             mainAxisSpacing: 16,
      //                           ),
      //                           itemBuilder: (context, index) {
      //                             return GestureDetector(
      //                               onTap: () {
      //                                 Navigator.push(
      //                                   context,
      //                                   MaterialPageRoute(builder: (context) => DetailMenuPage(breakfast: snapshot.data![index]))
      //                                 );
      //                               },
      //                               child: Stack(
      //                                 children: [
      //                                   Container(
      //                                     margin: EdgeInsets.only(top: 5),
      //                                     width: double.infinity,
      //                                     height: double.infinity,
      //                                     child: Image.network("${snapshot.data![index].image}",
      //                                       fit: BoxFit.cover,
      //                                     ),
      //                                   ),
      //
      //                                   Column(
      //                                     mainAxisAlignment: MainAxisAlignment.end,
      //                                     crossAxisAlignment: CrossAxisAlignment.center,
      //                                     children: [
      //                                       Container(
      //                                         width: double.infinity,
      //                                         color: Colors.white54,
      //                                         child: Text("${snapshot.data![index].title}",
      //                                           textAlign: TextAlign.center,
      //                                           style: GoogleFonts.lexend(
      //                                             fontSize: 16,
      //                                             fontWeight: FontWeight.bold,
      //                                             fontStyle: FontStyle.normal,
      //                                             color: Colors.black,
      //                                           ),
      //                                         ),
      //                                       ),
      //
      //                                       Container(
      //                                         width: double.infinity,
      //                                         color: Colors.white54,
      //                                         child: Text("${snapshot.data![index].serve} People",
      //                                           textAlign: TextAlign.center,
      //                                           style: GoogleFonts.lexend(
      //                                             fontSize: 12,
      //                                             fontWeight: FontWeight.normal,
      //                                             fontStyle: FontStyle.normal,
      //                                             color: Colors.black,
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             );
      //                           },
      //                       ),
      //                     );
      //                   }
      //                 }
      //               }
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}