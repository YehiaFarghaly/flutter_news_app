import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/modules/search/search_screen.dart';
import 'package:flutter_news_app/shared/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var cubit = NewsCubit.get(context);
        cubit.getBusinessNews();
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              },
                  icon: Icon(Icons.search,),
              ),
              IconButton( icon: Icon(
                Icons.brightness_4_outlined,
              ),
                onPressed: (){
                  NewsCubit.get(context).changeTheme();
                  print("object");
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIdx,
            onTap: (index){
                cubit.changeBottomItem(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.screens[cubit.currentIdx],
        );
      } ,

    );
  }
}
