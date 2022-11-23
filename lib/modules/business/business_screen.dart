import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/cubit.dart';
import 'package:flutter_news_app/cubit/states.dart';
import 'package:flutter_news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is GetNewsBusinessLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
          physics:BouncingScrollPhysics(),
                itemBuilder: (context,index)=> buildNewsArticle(),
                separatorBuilder: (context,index) => myDivider(),
                itemCount: 10);
      },
    );
  }
}
