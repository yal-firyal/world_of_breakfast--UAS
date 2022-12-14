import 'package:dio/dio.dart';
import 'package:world_of_breakfast/model/breakfast.dart';
import 'package:world_of_breakfast/utils.dart';

class BreakfastService {
  //menggunakan asyncronous untuk ambil data api
  static Future<List<Breakfast>> getDataBreakfast() async {
    Dio dio = Dio();
    
    // var response = await dio.get('http://192.168.30.175:3000/menu');
    var response = await Dio().get('${BASE_URL}/menu');
    // var response = await dio.get('http://10.0.2.1:3000/menu');
    // var response = await dio.get('http://localhost:3000/menu');

    print(response.data.toString());
    List<Breakfast> breakfasts =
    (response.data as List).map((v) => Breakfast.fromJson(v)).toList();

    return breakfasts;
  }
}