import 'package:flutter/material.dart';
import 'Search_screen.dart';
import 'mobile_screen_layout.dart';
import 'web_.dart';
import 'responsive_layout_screen.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Google Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:backgroundColor
      ),
      home: ResponsiveLayoutScreen(
        mobileScreenLayout:MobileScreenLayout(),
        webScreenLayout:WebScreenLayout() ,
      ),
    );
  }

}