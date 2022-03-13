import 'package:flutter/material.dart';

import 'main.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  // The selected index of Bottom Navigation Bar Item
  static int _selected=0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light?Colors.black54:Colors.white54,  //to check if dark mode is enabled or not
        iconSize: 30,
        currentIndex: _selected,
        onTap: (int newIndex){  // on tapping on other navigation bar item this function is called
          setState(() {
            _selected=newIndex;   // The selected index is changed with new index
          });
        },
        items: <BottomNavigationBarItem>[   //Items that will be displayed in the navigation bar
          BottomNavigationBarItem(
            icon: Icon(Icons.star,
                color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black),
            title: Text("Label",
            style: TextStyle(
              color:MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black
            ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle,
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black),
              title: Text("Label",
                style: TextStyle(
                    color:MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.crop_square,
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black),
              title: Text("Label",
                style: TextStyle(
                    color:MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.track_changes,
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black),
              title: Text("Label",
                style: TextStyle(
                    color:MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.update,
                  color: MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black),
              title: Text("Label",
                style: TextStyle(
                    color:MyApp.themeNotifier.value == ThemeMode.light?Colors.white:Colors.black
                ),
              )),
        ]
    );
  }
}
