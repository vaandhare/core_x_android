import 'package:core_x/pages/bottomNav/store.dart';
import 'package:flutter/material.dart';

import 'custom_build.dart';
import 'pre_build.dart';
import 'user_showcase.dart';

class BottomMain extends StatefulWidget {
  @override
  _BottomMainState createState() => _BottomMainState();
}

class _BottomMainState extends State<BottomMain> {
  PageController _pageController = new PageController();

  List<Widget> _NavScreens = [
    PreBuild(),
    CustomBuild(),
    Store(),
    UserShowcase()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Core-X Workshop'), backgroundColor: Colors.deepOrange),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Pre-Builds"),
              trailing: Icon(Icons.laptop),
            ),
            ListTile(
              title: Text("Custom-Builds"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Shop"),
              trailing: Icon(Icons.keyboard),
            ),
            ListTile(
              title: Text("User Showcase"),
              trailing: Icon(Icons.people),
            ),
            ListTile(
              title: Text("About Us"),
              trailing: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text("Contact Us"),
              trailing: Icon(Icons.contact_phone),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _NavScreens,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.deepOrange,
        selectedFontSize: 15.0,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            title: Text('Pre-Build'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Custom-Build'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            title: Text('Store'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('User Showcase'),
          ),
        ],
      ),
    );
  }
}
