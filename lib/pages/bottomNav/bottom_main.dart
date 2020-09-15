import 'file:///D:/Projects/Flutter/core_x/lib/pages/bottomNav/clients_build.dart';
import 'file:///D:/Projects/Flutter/core_x/lib/pages/bottomNav/pc_parts.dart';
import 'file:///D:/Projects/Flutter/core_x/lib/pages/bottomNav/pre_build.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'custom_build.dart';

class BottomMain extends StatelessWidget {

  PersistentTabController _controller =PersistentTabController(initialIndex: 0);

  List<Widget> _NavScreens() {
    return [
      PreBuild(),
      CustomBuild(),
      PcParts(),
      ClientsBuild(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.laptop),
        title: ("Pre-Build"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Custom-Build"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.keyboard),
        title: ("PC Parts"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.people),
        title: ("Client-Build"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Core-X Workshop'),
        backgroundColor: Colors.deepOrange
      ),
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
              title: Text("PC Parts"),
              trailing: Icon(Icons.keyboard),
            ),
            ListTile(
              title: Text("Clients-Builds"),
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
      body: PersistentTabView(
      controller: _controller,
      screens: _NavScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      navBarStyle: NavBarStyle.style2,
    ),
    );
  }
}
