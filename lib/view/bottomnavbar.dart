import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:world_of_breakfast/view/about.dart';
import 'package:world_of_breakfast/view/account.dart';
import 'package:world_of_breakfast/view/home.dart';
import 'package:world_of_breakfast/view/search.dart';

class Navbar extends StatefulWidget {
  String str = "";
  Navbar({Key? key, required this.str}) : super(key: key);

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
      // SearchPage(),
      AboutPage(),
      AccountPage(str: widget.str),
    ];

    return Scaffold(
      body: Center(
        child: _pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xff87A8A1),
        height: 50,
        items: [
          TabItem(icon: Icons.home_filled),
          // TabItem(icon: Icons.search_rounded),
          TabItem(icon: Icons.info_rounded),
          TabItem(icon: Icons.person_rounded),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
