import 'package:dio/dio.dart';
import 'package:world_of_breakfast/model/breakfast.dart';

class BreakfastService {
  static Future<List<Breakfast>> getDataBreakfast() async {
    Dio dio = Dio();
    
    var response = await dio.get('http://localhost:3000/breakfast');
    // var response = await dio.get('http://10.0.2.2:3000/breakfast');
    List<Breakfast> breakfasts =
      (response.data as List).map((v) => Breakfast.fromJson(v)).toList();

    // List<Breakfast> breakfasts =
    // (response.data['breakfast'] as List).map((v) => Breakfast.fromJson(v)).toList();

    return breakfasts;
  }
}