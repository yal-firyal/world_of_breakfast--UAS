import 'package:world_of_breakfast/model/breakfast.dart';

class Search {
  List<Breakfast>? breakfast;

  Search({this.breakfast});

  Search.fromJson(Map<String, dynamic> map) {
    if (map['breakfast'] != null) {
      breakfast = <Breakfast>[];
      map['breakfast'].forEach((v) {
        breakfast!.add(new Breakfast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breakfast != null) {
      data['menu'] = this.breakfast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}