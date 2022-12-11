import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:world_of_breakfast/view/home.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePage(),
    ];

    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xff87A8A1),
        items: const [
          TabItem(icon: Icons.home_filled),
          TabItem(icon: Icons.search_rounded),
          TabItem(icon: Icons.person_rounded),
        ],
        // initialActiveIndex: _selectedNavbar,
        // onTap: _changeSelectedNavBar,
      ),
    );
  }
}
