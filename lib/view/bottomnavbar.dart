import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:world_of_breakfast/view/account.dart';
import 'package:world_of_breakfast/view/home.dart';
import 'package:world_of_breakfast/view/search.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pageOptions = <Widget> [
      HomePage(),
      SearchPage(),
      AccountPage(),
    ];

    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 16,
        backgroundColor: Color(0xff87A8A1),
        selectedIconTheme: const IconThemeData(
          color: Color(0xff87A8A1),
          size: 30,
        ),
        selectedItemColor: const Color(0xff87A8A1),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Roboto",
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.black,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
      // bottomNavigationBar: ConvexAppBar(
      //   backgroundColor: Color(0xff87A8A1),
      //   items: [
      //     TabItem(icon: Icons.home_filled),
      //     TabItem(icon: Icons.search_rounded),
      //     TabItem(icon: Icons.person_rounded),
      //   ],
      //   currentIndex: _selectedIndex,
      //   onTap: _onTabTapped,
      // ),
    );
  }
}
