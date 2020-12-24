class Cuisine {
  final cuisineId;
  final cuisineName;

  Cuisine({this.cuisineId, this.cuisineName});

  factory Cuisine.fromJson(Map<String, dynamic> data) {
    return Cuisine(
        cuisineId: data['cuisine_id'], cuisineName: data['cuisine_name']);
  }
}

class Cuisines {
  List<Cuisine> cuisines;

  Cuisines({this.cuisines});

  factory Cuisines.fromList(List<dynamic> cuisines) {
    return Cuisines(
      cuisines: cuisines.map((e) => Cuisine.fromJson(e['cuisine'])).toList(),
    );
  }
}
