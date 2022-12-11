import 'dart:convert';

import 'package:world_of_breakfast/model/breakfast.dart';

DetailMasak masakFromJson(String str) => DetailMasak.fromJson(json.decode(str));

String masakToJson(DetailMasak data) => json.encode(data.toJson());

class DetailMasak {
  Breakfasts breakfasts;

  DetailMasak({
    required this.breakfasts,
  });

  factory DetailMasak.fromJson(Map<String, dynamic> json) => DetailMasak(
    breakfasts: Breakfasts.fromJson(json["breakfasts"]),
  );

  Map<String, dynamic> toJson() => {
    "breakfasts": breakfasts.toJson(),
  };
}

class Breakfasts {
  String title;
  String image;
  // String key;
  String kalori;
  String karbo;
  String protein;
  String serve;
  String minute;
  String desc;
  List<String> ingredient;
  List<String> step;

  Breakfasts(
      {
        required this.title,
        required this.image,
        // required this.key,
        required this.kalori,
        required this.karbo,
        required this.protein,
        required this.serve,
        required this.minute,
        required this.desc,
        required this.ingredient,
        required this.step,
      });

  factory Breakfasts.fromJson(Map<String, dynamic> json) => Breakfasts(
    title: json['title'],
    image: json['image'],
    // key: json["key"],
    kalori: json['kalori'],
    karbo: json['karbo'],
    protein: json['protein'],
    serve: json['serve'],
    minute: json['minute'],
    desc: json['desc'],
    ingredient: List<String>.from(json["ingredient"].map((x) => x)),
    step: List<String>.from(json["step"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    // "key": key,
    "kalori": kalori,
    "karbo": karbo,
    "protein": protein,
    "serve": serve,
    "minute": minute,
    "desc": desc,
    "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
    "step": List<dynamic>.from(step.map((x) => x)),
  };
}