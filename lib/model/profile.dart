import 'dart:convert';

class Profile {
  int id;
  String email;
  int password;
  String name;
  int age;

  Profile ({required this.id, required this.email, required this.password, required this.name, required this.age});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(id: map["id"], email: map["email"], password: map["password"], name: map["name"], age: map["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "email": email, "password": password, "name": name, "age": age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, email: $email, password: $password, name: $name, age: $age}';
  }
}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}