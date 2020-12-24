class Suggestion {
  final String entityType;
  final int entityId;
  final String title;
  final latitude;
  final longitude;
  final int cityId;
  final String cityName;
  final int countryId;
  final String countryName;

  Suggestion(
      {this.entityType,
      this.entityId,
      this.title,
      this.latitude,
      this.longitude,
      this.cityId,
      this.cityName,
      this.countryId,
      this.countryName});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      entityId: json['entity_id'],
      entityType: json['entity_type'],
      title: json['title'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
    );
  }
}

class LocationSuggestions {
  List<Suggestion> suggestions;

  LocationSuggestions({this.suggestions});

  factory LocationSuggestions.fromList(List<dynamic> suggestions) {
    return LocationSuggestions(
        suggestions: suggestions.map((e) => Suggestion.fromJson(e)).toList());
  }
}

class Location {
  LocationSuggestions locationSuggestions;
  final String status;
  final hasMore;
  final hasTotal;
  final userHasAddress;

  Location(
      {this.status,
      this.hasMore,
      this.hasTotal,
      this.userHasAddress,
      this.locationSuggestions});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        locationSuggestions:
            LocationSuggestions.fromList(json['location_suggestions']),
        status: json['status'],
        hasMore: json['has_more'],
        hasTotal: json['has_total'],
        userHasAddress: json['user_has_addresses']);
  }
}
