class Establishment {
  final establishmentId;
  final establishmentName;

  Establishment({this.establishmentId, this.establishmentName});

  factory Establishment.fromJson(Map<String, dynamic> data) {
    return Establishment(
        establishmentId: data['id'], establishmentName: data['name']);
  }
}

class Establishments {
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
