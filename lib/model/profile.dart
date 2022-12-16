class Profile {
  int id;
  String email;
  String password;
  String name;

  Profile (
  {
    required this.id,
    required this.email,
    required this.password,
    required this.name
  });

  factory Profile.fromJson(Map<String, dynamic> map) => Profile(
    id: map['id'],
    email: map['email'],
    password: map['password'],
    name: map['name']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "name": name
  };
}