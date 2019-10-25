import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'bottom_tab.dart';

// https://dribbble.com/shots/7807406-Knights-shop/attachments/463368?mode=media

class KnightsApp extends StatefulWidget {
  @override
  _KnightsAppState createState() => _KnightsAppState();
}

class _KnightsAppState extends State<KnightsApp> {
  Color _color = Color.fromRGBO(136, 123, 121, 1);
  int currentIndex = 1;
  List<Widget> pages;

  void _onTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _definePages();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main
          Positioned(
            top: 0,
            left: 24.0,
            right: 0,
            bottom: 64.0,
            child: pages[currentIndex],
          ),

          // bottombar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              height: 64.0,
//              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomTab(
                    iconData: Icons.home,
                    text: "Home",
                    isSelected: currentIndex == 0,
                    onTab: () {
                      _onTab(0);
                    },
                  ),
                  BottomTab(
                    iconData: Icons.menu,
                    text: "Shop",
                    isSelected: currentIndex == 1,
                    onTab: () {
                      _onTab(1);
                    },
                  ),
                  BottomTab(
                    iconData: Icons.bookmark_border,
                    text: "Mark",
                    isSelected: currentIndex == 2,
                    onTab: () {
                      _onTab(2);
                    },
                  ),
                  BottomTab(
                    iconData: Icons.person_outline,
                    text: "User",
                    isSelected: currentIndex == 3,
                    onTab: () {
                      _onTab(3);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _definePages() {
    pages = [
      Placeholder(
        color: Colors.red,
      ),
      
      // main pages
      Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              margin: EdgeInsets.only(right: 24.0),
              height: 32.0,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.menu, size: 28.0, color: _color,),
                    Spacer(),
                    Badge(
                      child: Icon(Icons.shopping_basket, size: 28.0, color: _color,),
                    padding: EdgeInsets.all(4.0),
                    showBadge: true,
                    position: BadgePosition.topRight(top: 5.0, right: 0.0),
                    ),
                  ],
                ),
            ),
          ),

          
        ],
      ),
      Placeholder(
        color: Colors.black,
      ),
      Placeholder(
        color: Colors.indigo,
      ),
    ];
  }
}
