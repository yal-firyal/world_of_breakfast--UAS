import 'package:http/http.dart';
import 'package:world_of_breakfast/model/breakfast.dart';

Future<List<Breakfast>> fetchMasak() async {
  List<Breakfast> datamasak;

  Response response = await get(Uri.parse(
    'http://localhost:3000/breakfast/?limit=10'));

  if (response.statusCode == 200) {
    final masak = masakFromJson(response.body);
    Map jsonMasak = masak.toJson();
    List listMasak = jsonMasak["breakfasts"] as List;
    datamasak = listMasak.map<Breakfast>((json) => Breakfast.fromJson(json)).toList();
    return datamasak;
  } else {
    throw Exception('Failed to load data breakfast');
  }
}

Future<List<Breakfast>> fetchMasakPage(int page) async {
  List<Breakfast> datamasak;

  Response response = await get(
    Uri.parse('http://localhost:3000/breakfast/$page'));

  if (response.statusCode == 200) {
    final masak = masakFromJson(response.body);
    Map jsonMasak = masak.toJson();
    List listMasak = jsonMasak["breakfasts"] as List;
    datamasak = listMasak.map<Breakfast>((json) => Breakfast.fromJson(json)).toList();
    return datamasak;
  } else {
    throw Exception('Failed to load data breakfast');
  }
}

Future<List<Breakfast>> fetchCariResep(String katakunci) async {
  List<Breakfast> dataresep;

  Response response = await get(
      Uri.parse('http://localhost:3000/breakfast/?q=$katakunci'));

  if (response.statusCode == 200) {
    final masak = masakFromJson(response.body);
    Map jsonMasak = masak.toJson();
    List listMasak = jsonMasak["breakfasts"] as List;
    dataresep = listMasak.map<Breakfast>((json) => Breakfast.fromJson(json)).toList();
    return dataresep;
  } else {
    throw Exception('Failed to load data breakfast');
  }
}