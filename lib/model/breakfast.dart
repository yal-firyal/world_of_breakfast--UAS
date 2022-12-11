import 'dart:convert';

Masak masakFromJson(String str) => Masak.fromJson(json.decode(str));

String masakToJson(Masak data) => json.encode(data.toJson());

class Masak {
  List<Breakfast> breakfasts;

  Masak(
  {
    required this.breakfasts,
  });

  factory Masak.fromJson(Map<String, dynamic> json) => Masak(
    breakfasts: List<Breakfast>.from(json["breakfasts"].map((x) => Breakfast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "breakfasts": List<dynamic>.from(breakfasts.map((x) => x.toJson())),
  };
}

class Breakfast {
  String title;
  String image;
  String key;
  String kalori;
  String karbo;
  String protein;
  String serve;
  String minute;
  String desc;

  Breakfast(
  {
    required this.title,
    required this.image,
    required this.key,
    required this.kalori,
    required this.karbo,
    required this.protein,
    required this.serve,
    required this.minute,
    required this.desc,
  });

  factory Breakfast.fromJson(Map<String, dynamic> json) => Breakfast(
    title: json['title'],
    image: json['image'],
    key: json["key"],
    kalori: json['kalori'],
    karbo: json['karbo'],
    protein: json['protein'],
    serve: json['serve'],
    minute: json['minute'],
    desc: json['desc'],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "key": key,
    "kalori": kalori,
    "karbo": karbo,
    "protein": protein,
    "serve": serve,
    "minute": minute,
    "desc": desc,
  };
}