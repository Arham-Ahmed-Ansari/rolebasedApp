import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project9/screens/user.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentindex = 0;

  void _navigateBottombar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  final List<Widget> tabs = [
    UserScreen(),
    Center(
        child: Text(
      "search",
      style: TextStyle(fontSize: 50),
    )),
    Center(
        child: Text(
      "Services",
      style: TextStyle(fontSize: 50),
    )),
    Center(
        child: Text(
      "user",
      style: TextStyle(fontSize: 50),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      bottomNavigationBar: Container(
        color: Color(0xffFFFFFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: GNav(
              backgroundColor: Color(0xffFFFFFF),
              padding: EdgeInsets.all(16),
              tabBorderRadius: 50,
              gap: 8,
              tabBackgroundColor: Colors.deepPurple,
              selectedIndex: _currentindex,
              onTabChange: _navigateBottombar,
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Search",
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                ),
                GButton(
                  icon: Icons.medical_services,
                  text: "Services",
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                ),
                GButton(
                  icon: Icons.person,
                  text: "User",
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                ),
              ]),
        ),
      ),
    );
  }
}
