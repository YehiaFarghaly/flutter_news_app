import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/network/dio/dio_helper.dart';

import 'layouts/home_layout.dart';

void main() {
  DIOHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      Directionality(
          textDirection: TextDirection.rtl,
          child: NewsLayout()
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange[200],
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.orange,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Colors.lightBlue,
            size: 30,
          ),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          backgroundColor: Colors.orange,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
