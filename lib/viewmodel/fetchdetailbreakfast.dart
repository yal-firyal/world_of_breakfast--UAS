import 'package:http/http.dart';
import 'package:world_of_breakfast/model/detailbreakfast.dart';

Future<DetailMasak> fetchDetailMasak(String judul) async {
  DetailMasak datamasak;

  Response response = await get(Uri.parse(
    'http://localhost:3000/breakfast/:$judul'));

  if (response.statusCode == 200) {
    final masak = masakFromJson(response.body);
    datamasak = DetailMasak.fromJson(masak.toJson());
    return datamasak;
  } else {
    throw Exception('Failed to load data breakfast');
  }
}