import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/business/business_screen.dart';
import 'package:flutter_news_app/modules/science/science_screen.dart';
import 'package:flutter_news_app/modules/search/search_screen.dart';
import 'package:flutter_news_app/modules/sports/sports_screen.dart';
import 'package:flutter_news_app/network/dio/dio_helper.dart';
import 'package:flutter_news_app/network/local/cache_helper.dart';

import '../shared/constants.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIdx = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
     SearchScreen()
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
    if (business.length == 0) {
      emit(GetNewsBusinessLoading());
      DIOHelper.getData(PATH, {
        'country': 'eg',
        'category': 'business',
        'apiKey': API_KEY
      }).then((value) {
        business = value.data['articles'];
        emit(GetNewsBusinessSuccess());
        print(business.length);
      }).catchError((error) {
        emit(GetNewsBusinessError('Error occurred'));
      });
    } else
      emit(GetNewsBusinessSuccess());
  }

  List<dynamic> sports = [];

  void getSportsNews() {
    if (sports.length == 0) {
      emit(GetNewsSportsLoading());
      DIOHelper.getData(
              PATH, {'country': 'eg', 'category': 'sports', 'apiKey': API_KEY})
          .then((value) {
        sports = value.data['articles'];
        emit(GetNewsSportsSuccess());
        print(sports.length);
      }).catchError((error) {
        emit(GetNewsSportsError('Error occurred'));
      });
    } else {
      emit(GetNewsSportsSuccess());
    }
  }

  List<dynamic> science = [];

  void getScienceNews() {
    if (science.length == 0) {
      emit(GetNewsScienceLoading());
      DIOHelper.getData(
              PATH, {'country': 'eg', 'category': 'science', 'apiKey': API_KEY})
          .then((value) {
        science = value.data['articles'];
        emit(GetNewsScienceSuccess());
        print(science.length);
      }).catchError((error) {
        emit(GetNewsScienceError('Error occurred'));
      });
    } else {
      emit(GetNewsScienceSuccess());
    }
  }

  List<dynamic> search = [];

  void searchForNews(String value) {
    emit(GetNewsSearchLoading());
    DIOHelper.getData(
        SEARCH_PATH, {SEARCH_QUERY: '${value}', 'apiKey': API_KEY})
        .then((value) {
      search = value.data['articles'];
      emit(GetNewsSearchSuccess());
      print(search.length);
    }).catchError((error) {
      emit(GetNewsSearchError('Error occurred'));
    });
  }

  void changeBottomItem(int index) {
    currentIdx = index;
    if (index == 1)
      getScienceNews();
    else if (index == 2) getSportsNews();
    print("ads");
    emit(BottomNavState());
  }

  bool isDark = CacheHelper.getData('isDark') == null
      ? false
      : CacheHelper.getData('isDark')!;

  void changeTheme() {
    isDark = !isDark;
    CacheHelper.putData('isDark', isDark).then((value) {
      emit(GetThemeChangedState());
    });

    print(isDark);
  }
}
