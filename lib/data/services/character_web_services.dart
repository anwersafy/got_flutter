import 'package:dio/dio.dart';
import 'package:omarahmed_cubit/constants/strings.dart';

class CharacterWebServices {
  late Dio dio  ;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
       connectTimeout: Duration(seconds: 20), // 60 seconds\
       receiveTimeout: Duration(seconds: 20),
    // 60 seconds
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('Characters');// Characters is the endpoint
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


}