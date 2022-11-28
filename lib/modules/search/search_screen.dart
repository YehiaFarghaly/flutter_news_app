import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {

 var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (builder: (context,state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title:   defaultFormField(
                controller: searchController,
                type: TextInputType.text,
                validate: (value){
                  if(value==null){
                    return 'Please Enter a valid key word';
                  }
                  return null;
                },
                label: 'Search',
                onChanged: (value){
                  NewsCubit.get(context).searchForNews(value);
                }
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                Expanded(
                    child: articleBuilder(list)
                ),
              ],
            ),
          ),
        );
    },
        listener: (context,state){}
    );
  }
}
