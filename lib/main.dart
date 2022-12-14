import 'package:flutter/material.dart';
// import 'package:world_of_breakfast/view/home.dart';
import 'package:world_of_breakfast/view/splashscreen.dart';
import 'package:world_of_breakfast/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs =  await SharedPreferences.getInstance();
  // return runApp(ChangeNotifierProvider(
  //   child: MyApp(),
  //   create: (BuildContext context) => ThemeProvider(isDarkMode: prefs.getBool("isDarkTheme")),
  // ));

  // SharedPreferences.getInstance().then((prefs) {
  //   var isDarkTheme = prefs.getBool("darkTheme") ?? false;
  //   return runApp(
  //     ChangeNotifierProvider<ThemeProvider>(
  //       child: MyApp(),
  //       create: (BuildContext context) {
  //         return ThemeProvider(isDarkTheme);
  //       },
  //     ),
  //   );
  // });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff87A8A1),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, value, child) {
//         return MaterialApp(
//           title: 'World Of Breakfast',
//           theme: value.getTheme(),
//           home: SplashScreen(),
//         );
//       },
//     );
//   }
// }


// class MyApp extends StatefulWidget {
//   // const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, themeProvider, child) {
//         return MaterialApp(
//           title: 'World Of Breakfast',
//           theme: themeProvider.getTheme(),
//           home: SplashScreen(),
//         );
//       },
//     );
//   }
// }
