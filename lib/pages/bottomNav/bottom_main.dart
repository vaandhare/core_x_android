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

  List<Widget> _navScreens = [
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
          title: Text(
            'Core-X Workshop',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontFamily: 'GoogleSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            )
          ],
          iconTheme: new IconThemeData(color: Colors.deepOrange),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Username",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                    ])),
            Divider(),
            ListTile(
              title: Text("Pre-Builds"),
              leading: Icon(Icons.laptop),
            ),
            Divider(),
            ListTile(
              title: Text("Custom-Builds"),
              leading: Icon(Icons.settings),
            ),
            Divider(),
            ListTile(
              title: Text("Shop"),
              leading: Icon(Icons.keyboard),
            ),
            Divider(),
            ListTile(
              title: Text("User Showcase"),
              leading: Icon(Icons.people),
            ),
            Divider(),
            ListTile(
              title: Text("About Us"),
              leading: Icon(Icons.info_outline),
            ),
            Divider(),
            ListTile(
              title: Text("Contact Us"),
              leading: Icon(Icons.contact_phone),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: _navScreens,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        elevation: 0.0,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.deepOrange,
        selectedFontSize: 15.0,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            label: 'Pre-Build',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Custom-Build',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User Showcase',
          ),
        ],
      ),
    );
  }
}
