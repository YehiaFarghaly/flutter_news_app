import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/network/dio/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return BlocProvider(
      create: (context)=> ThemeCubit(),
      child: BlocConsumer<ThemeCubit,ThemeMode> (
        listener:(context,state){} ,
        builder: (context,state){
          return MaterialApp(
            home: NewsLayout(),
            theme: ThemeData(
              primarySwatch: Colors.brown,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.orange[400],
                    statusBarBrightness: Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backgroundColor: Colors.orange,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: IconThemeData(
                  color: Colors.brown,
                  size: 30,
                ),
                unselectedItemColor: Colors.white,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.orange,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.orange,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarBrightness: Brightness.light
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: HexColor('333739'),
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
                  color: Colors.orange,
                  size: 30,
                ),
                unselectedItemColor: Colors.white,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: HexColor('333739'),
              ),
            ),
            themeMode: state,
            debugShowCheckedModeBanner: false,
          );
        }
      ),
    );
  }
}
