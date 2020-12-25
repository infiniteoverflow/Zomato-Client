/// Gives the detail about each cuisine
class Cuisine {
  /// ID of the Cuisine
  final cuisineId;

  /// The name of the Cuisine
  final cuisineName;

  Cuisine({this.cuisineId, this.cuisineName});

  factory Cuisine.fromJson(Map<String, dynamic> data) {
    return Cuisine(
        cuisineId: data['cuisine_id'], cuisineName: data['cuisine_name']);
  }
}

/// Gives the list of all cuisines available
class Cuisines {
  /// List of Cuisine Objects
  List<Cuisine> cuisines;

  Cuisines({this.cuisines});

  factory Cuisines.fromList(List<dynamic> cuisines) {
    return Cuisines(
      cuisines: cuisines.map((e) => Cuisine.fromJson(e['cuisine'])).toList(),
    );
  }
}
