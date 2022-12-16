// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:world_of_breakfast/model/breakfast.dart';
// import 'package:world_of_breakfast/service/breakfast_service.dart';
// import 'package:world_of_breakfast/utils.dart';
// import 'package:world_of_breakfast/view/detailmenu.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   List<Breakfast>? daftarHasilPencarianResep;
//   late List<Breakfast> listHasilCari;
//   TextEditingController controllerCari = TextEditingController();
//   late String katakunci;
//   late bool prosesCari;
//   bool adaHasil = false;
//   late Widget dialogProgress;
//
//   @override
//   void initState() {
//     super.initState();
//     katakunci = '';
//     prosesCari = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Bagian field pencarian.
//     Widget fieldPencarian = Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         onSubmitted: (value) {
//           setState(() {
//             prosesCari = true;
//             katakunci = value;
//           });
//           controllerCari.clear();
//         },
//         controller: controllerCari,
//         textInputAction: TextInputAction.search,
//         decoration: const InputDecoration(
//           hintText: 'Search',
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(20),
//             ),
//           ),
//           // hintStyle: GoogleFonts.lexend(
//           //   fontSize: 16,
//           //   fontWeight: FontWeight.normal,
//           //   fontStyle: FontStyle.normal,
//           //   color: Color(0xff87A8A1),
//           // ),
//         ),
//       ),
//     );
//
//     // Bagian logo pencarian.
//     Widget logoCari = Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Icon(
//           Icons.search,
//           size: 40,
//           color: Colors.grey,
//         ),
//         Text(
//           'What breakfast today?',
//           style: TextStyle(fontSize: 20, color: Colors.grey),
//         )
//       ],
//     );
//
//     // Bagian futurebuilder.
//     Widget tampilHasilCari = FutureBuilder<List<Breakfast>>(
//       future: fetchCariMenu(katakunci),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text('Gagal ambil data...'),
//           );
//         }
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasData && snapshot.data!.isEmpty) {
//           return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.warning,
//                     size: 40,
//                     color: Colors.grey,
//                   ),
//                   Text(
//                     'Tidak ditemukan',
//                     style: TextStyle(fontSize: 20, color: Colors.grey),
//                   )
//                 ],
//               ));
//         }
//         return ListMenu(breakfast: snapshot.data);
//       },
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'SEARCH',
//           style: GoogleFonts.lexend(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.normal,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xff87A8A1),
//         automaticallyImplyLeading: false,
//         elevation: 1,
//       ),
//
//       body: Column(
//         children: [
//           fieldPencarian,
//           Expanded(child: (prosesCari == true) ? tampilHasilCari : logoCari),
//         ],
//       ),
//     );
//   }
// }
//
// Future<List<Breakfast>> fetchCariMenu(String katakunci) async {
//   List<Breakfast> datamenu;
//   datamenu = BreakfastService.getDataBreakfast() as List<Breakfast>;
//
//   Response response = await Dio().get('${BASE_URL}/menu/?q=$katakunci');
//   if (response.statusCode == 200) {
//     Map<String, dynamic> toJson() {
//       final Map<String, dynamic> data = new Map<String, dynamic>();
//       if (datamenu != null) {
//         data['menu'] = datamenu!.map((v) => v.toJson()).toList();
//       }
//       return data;
//     }
//     return datamenu;
//   } else {
//     throw Exception('Failed to load data menu');
//   }
// }
//
// class ListMenu extends StatelessWidget {
//   const ListMenu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
