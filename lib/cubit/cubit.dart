import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubit/states.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialState());
     static NewsCubit get(context) => BlocProvider.of(context);
}