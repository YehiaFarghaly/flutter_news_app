import 'package:dio/dio.dart';


import '../../shared/constants.dart';

class DIOHelper{
  static late Dio dio;
  static init(){
  dio = Dio(BaseOptions(
    baseUrl:BASE_URL,
    receiveDataWhenStatusError: true,
  ),
  );
}

static Future<Response> getData(String path,Map<String,dynamic> query)async{
    return await dio.get(path,queryParameters: query);
}
}