/// Gives details of each Establishment
class Establishment {
  /// Establishment ID
  final establishmentId;

  /// Name of the Establishment
  final establishmentName;

  Establishment({this.establishmentId, this.establishmentName});

  factory Establishment.fromJson(Map<String, dynamic> data) {
    return Establishment(
        establishmentId: data['id'], establishmentName: data['name']);
  }
}

/// Gives a list of all the establishments
class Establishments {
  /// List of Establishment Objects
  List<Establishment> establishments;

  Establishments({this.establishments});

  factory Establishments.fromList(List<dynamic> establishments) {
    return Establishments(
      establishments: establishments
          .map((e) => Establishment.fromJson(e['establishment']))
          .toList(),
    );
  }
}
