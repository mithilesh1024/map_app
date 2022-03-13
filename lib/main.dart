import 'package:flutter/material.dart';
import 'package:map_app/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // themeNotifier is used to check is dark mode is activated or deactivated. Initial value of dark mode is deactivated.
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(    // This will listen to any change in themeNotifier
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode,_){
        return MaterialApp(
          title: 'Map App',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          home: HomePage(),
        );
      }
    );
  }
}

