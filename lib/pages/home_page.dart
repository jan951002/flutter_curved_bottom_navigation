import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_curved_bottom_navigation/pages/profile_page.dart';
import 'package:flutter_curved_bottom_navigation/pages/search_page.dart';

import 'display_container.dart';
import 'list_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DisplayContainer(Center(child: Icon(Icons.home))),
    DisplayContainer(SearchPage()),
    DisplayContainer(ListPage()),
    DisplayContainer(ProfilePage())
  ];
  List<String> titles = [
    'Home',
    'Search',
    'List',
    'Profile',
  ];

  Widget getContentHome() {
    return Center(
      child: Icon(Icons.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.list),
          Icon(Icons.account_circle),
        ],
        onTap: _onTabTapped,
      )
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
