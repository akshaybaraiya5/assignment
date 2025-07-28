import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation.dart';


void main() {
  runApp(InventoryApp());
}

class InventoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display',
      ),
      home: MainNavigation(),
      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/main': (context) => MainNavigation(),
      // },
    );
  }
}