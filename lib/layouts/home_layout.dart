import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(


      providers: [
        BlocProvider(create: (BuildContext context)=> NewsCubit()..getBusinessNews()),
      ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener:(context,state){} ,
        builder:(context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: (){
                },
                    icon: Icon(Icons.search,),
                ),
                IconButton( icon: Icon(
                  Icons.brightness_4_outlined,
                ),
                  onPressed: (){
                    ThemeCubit.get(context).toggleTheme();
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

      ),

    );
  }
}
