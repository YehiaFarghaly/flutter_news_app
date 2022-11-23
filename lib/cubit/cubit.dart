import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/business/business_screen.dart';
import 'package:flutter_news_app/modules/science/science_screen.dart';
import 'package:flutter_news_app/modules/settings/settings_screen.dart';
import 'package:flutter_news_app/modules/sports/sports_screen.dart';
import 'package:flutter_news_app/network/dio/dio_helper.dart';

import '../shared/constants.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIdx = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
    const SettingsScreen()
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports')
  ];
  List<dynamic> business = [];

  void getBusinessNews() {
    emit(GetNewsBusinessLoading());
    DIOHelper.getData(
            PATH, {'country': 'eg', 'category': 'business', 'apiKey': API_KEY})
        .then((value) {
                business = value.data['articles'];
                emit(GetNewsBusinessSuccess());
                print(business.length);
    })
        .catchError((error){
          emit(GetNewsBusinessError(error));
    });
  }

  void changeBottomItem(int index) {
    currentIdx = index;
    emit(BottomNavState());
  }
}
