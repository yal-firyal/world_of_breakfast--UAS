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
  List<String> ingredient;
  List<String> step;

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
    required this.ingredient,
    required this.step,
  });

  factory Breakfast.fromJson(Map<String, dynamic> map) => Breakfast(
    title: map['title'],
    image: map['image'],
    key: map['key'],
    kalori: map['kalori'],
    karbo: map['karbo'],
    protein: map['protein'],
    serve: map['serve'],
    minute: map['minute'],
    desc: map['desc'],
    ingredient: List<String>.from(map['ingredient'].map((x) => x)),
    step: List<String>.from(map['step'].map((x) => x)),
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
    "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
    "step": List<dynamic>.from(step.map((x) => x)),
  };
}