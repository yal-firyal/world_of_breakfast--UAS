import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_of_breakfast/model/breakfast.dart';
import 'package:world_of_breakfast/model/detailbreakfast.dart';
import 'package:world_of_breakfast/service/breakfast_service.dart';
import 'package:world_of_breakfast/viewmodel/fetchdatabreakfast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var screenHeight = MediaQuery.of(context).size.height;
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

      // body: FutureBuilder<List<Breakfast>>(
      //     future: BreakfastService.getDataBreakfast(),
      //     builder: (context, snapshot) {
      //       //loading
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: Text(
      //             'Still Loading...',
      //             style: GoogleFonts.lexend(
      //               fontSize: 24,
      //               fontWeight: FontWeight.bold,
      //               fontStyle: FontStyle.normal,
      //               color: Colors.black,
      //             ),
      //             textAlign: TextAlign.center,
      //           ),
      //         );
      //       } else {
      //         //error
      //         if (snapshot.hasError) {
      //           return Center(
      //             child: Text(
      //               'Error: ${snapshot.error.toString()}',
      //               style: GoogleFonts.lexend(
      //                 fontSize: 24,
      //                 fontWeight: FontWeight.bold,
      //                 fontStyle: FontStyle.normal,
      //                 color: Colors.black,
      //               ),
      //             ),
      //           );
      //         } else {
      //           //berhasil
      //           // return Text(snapshot.data.toString());
      //           return Padding(
      //             padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
      //             child: GridView.builder(
      //               itemCount: snapshot.data!.length,
      //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 crossAxisSpacing: 16,
      //                 mainAxisSpacing: 16,
      //               ),
      //               itemBuilder: (context, index) {
      //                 return Stack(
      //                   children: [
      //                     Container(
      //                       margin: EdgeInsets.only(top: 5),
      //                       width: double.infinity,
      //                       height: double.infinity,
      //                       child: Image.network("${snapshot.data![index].image}",
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //
      //                     Column(
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         Container(
      //                           width: double.infinity,
      //                           color: Colors.white,
      //                           child: Text("${snapshot.data![index].title}",
      //                             textAlign: TextAlign.left,
      //                             style: GoogleFonts.lexend(
      //                               fontSize: 16,
      //                               fontWeight: FontWeight.bold,
      //                               fontStyle: FontStyle.normal,
      //                               color: Colors.black,
      //                             ),
      //                           ),
      //                         ),
      //
      //                         Row(
      //                           children: [
      //                             Container(
      //                               width: double.infinity,
      //                               color: Colors.white,
      //                               margin: EdgeInsets.only(top: 5),
      //                               child: Icon(
      //                                 Icons.access_time_rounded,
      //                                 size: 8,
      //                                 color: Colors.black,
      //                               ),
      //                             ),
      //
      //                             Container(
      //                               child: Text("${snapshot.data![index].minute} min",
      //                                 textAlign: TextAlign.center,
      //                                 style: GoogleFonts.lexend(
      //                                   fontSize: 8,
      //                                   fontWeight: FontWeight.normal,
      //                                   fontStyle: FontStyle.normal,
      //                                   color: Colors.black,
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 );
      //               },
      //             ),
      //           );
      //         }
      //       }
      //     }
      // ),
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
      //               fontSize: 16,
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
      //           margin: const EdgeInsets.fromLTRB(24, 24, 0, 0),
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
      //                     return Center(
      //                       child: Text(
      //                         'Error: ${snapshot.error.toString()}',
      //                         style: GoogleFonts.lexend(
      //                           fontSize: 24,
      //                           fontWeight: FontWeight.bold,
      //                           fontStyle: FontStyle.normal,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     );
      //                   } else {
      //                     //berhasil
      //                     // return Text(snapshot.data.toString());
      //                     return Padding(
      //                       padding: const EdgeInsets.only(left: 28, right: 28, top: 0),
      //                       child: GridView.builder(
      //                           itemCount: snapshot.data!.length,
      //                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                             crossAxisCount: 2,
      //                             crossAxisSpacing: 16,
      //                             mainAxisSpacing: 16,
      //                           ),
      //                           itemBuilder: (context, index) {
      //                             return Stack(
      //                               children: [
      //                                 Container(
      //                                   margin: EdgeInsets.only(top: 5),
      //                                   width: double.infinity,
      //                                   height: double.infinity,
      //                                   child: Image.network("${snapshot.data![index].image}",
      //                                     fit: BoxFit.cover,
      //                                   ),
      //                                 ),
      //
      //                                 Column(
      //                                   mainAxisAlignment: MainAxisAlignment.end,
      //                                   crossAxisAlignment: CrossAxisAlignment.center,
      //                                   children: [
      //                                     Container(
      //                                       width: double.infinity,
      //                                       color: Colors.white54,
      //                                       child: Text("${snapshot.data![index].title}",
      //                                         textAlign: TextAlign.center,
      //                                         style: GoogleFonts.lexend(
      //                                           fontSize: 16,
      //                                           fontWeight: FontWeight.bold,
      //                                           fontStyle: FontStyle.normal,
      //                                           color: Colors.black,
      //                                         ),
      //                                       ),
      //                                     ),
      //
      //                                     Container(
      //                                       width: double.infinity,
      //                                       color: Colors.white54,
      //                                       child: Text("${snapshot.data![index].serve} People",
      //                                         textAlign: TextAlign.center,
      //                                         style: GoogleFonts.lexend(
      //                                           fontSize: 12,
      //                                           fontWeight: FontWeight.normal,
      //                                           fontStyle: FontStyle.normal,
      //                                           color: Colors.black,
      //                                         ),
      //                                       ),
      //                                     ),
      //
      //                                     // Row(
      //                                     //   children: [
      //                                     //     Container(
      //                                     //       width: double.infinity,
      //                                     //       color: Colors.white,
      //                                     //       margin: EdgeInsets.only(top: 5),
      //                                     //       child: Icon(
      //                                     //         Icons.access_time_rounded,
      //                                     //         size: 8,
      //                                     //         color: Colors.black,
      //                                     //       ),
      //                                     //     ),
      //                                     //
      //                                     //     Container(
      //                                     //       child: Text("${snapshot.data![index].minute} min",
      //                                     //         textAlign: TextAlign.center,
      //                                     //         style: GoogleFonts.lexend(
      //                                     //           fontSize: 8,
      //                                     //           fontWeight: FontWeight.normal,
      //                                     //           fontStyle: FontStyle.normal,
      //                                     //           color: Colors.black,
      //                                     //         ),
      //                                     //       ),
      //                                     //     ),
      //                                     //   ],
      //                                     // ),
      //                                   ],
      //                                 ),
      //                               ],
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 0, 0),
                child: Text(
                  "Start Your Day",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(24, 8, 0, 0),
                child: Text(
                  "With Your Favorite Breakfast",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(24, 24, 0, 0),
                child: Text(
                  "The Menu",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lexend(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                height: 3000,
                width: screenWidth,
                child: FutureBuilder<List<Breakfast>>(
                    future: fetchBreakfastPage(1),
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
                            ? ListBreakfast(breakfast: snapshot.data)
                            : const Center(child: CircularProgressIndicator());
                      }
                    }
                ),
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: ConvexAppBar(
      //   backgroundColor: Color(0xff87A8A1),
      //   items: [
      //     TabItem(
      //       icon: Icons.home_filled,
      //       // onPressed: () {
      //       //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      //       // }
      //     ),
      //     TabItem(icon: Icons.favorite_rounded),
      //     TabItem(icon: Icons.search_rounded),
      //     TabItem(icon: Icons.person_rounded),
      //   ],
      //   // initialActiveIndex: _selectedNavbar,
      //   // onTap: _changeSelectedNavBar,
      // ),
    );
  }
}

class ListBreakfast extends StatefulWidget {
  const ListBreakfast({Key? key, required this.breakfast}) : super(key: key);
  final List<Breakfast>? breakfast;

  @override
  State<ListBreakfast> createState() => _ListBreakfastState();
}

class _ListBreakfastState extends State<ListBreakfast> {
  ScrollController scrollController = ScrollController();
  List<Breakfast>? breakfast;
  int currentPage = 1;

  bool onnotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              25) {
        fetchBreakfastPage(currentPage + 1).then((value) {
          currentPage = currentPage + 1;
          setState(() {
            breakfast?.addAll(value);
          });
        });
      }
    }
    return true;
  }

  @override
  void initState() {
    breakfast = widget.breakfast;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onnotification,
      child: Center(
        child: ListView.builder(
          itemCount: breakfast!.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBreakfast(
                      breakfast: breakfast![index],
                    )
                  )
                );
              },
            )
          }
        ),
      ),
    );
  }
}

