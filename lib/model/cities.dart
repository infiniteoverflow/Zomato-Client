/// Gives the detail about each City along with various ids required for other APIs
class City {
  /// ID of the city
  final id;

  /// Name of the City
  final name;

  /// The ID of the Country to which the city belongs
  final countryId;

  /// The name of the Country to which the city belongs
  final countryName;

  /// The URL to the Country falg
  final countryFlagUrl;

  final shouldExperimentWith;
  final hasGoOutTab;
  final discoveryEnabled;
  final hasNewAdFormat;

  /// Defines whether it is a state or not
  final isState;

  /// If so , the ID of the state
  final stateId;

  /// The name of the State
  final stateName;

  /// The code of the state
  final stateCode;

  City({
    this.id,
    this.name,
    this.countryId,
    this.countryName,
    this.countryFlagUrl,
    this.shouldExperimentWith,
    this.hasGoOutTab,
    this.discoveryEnabled,
    this.hasNewAdFormat,
    this.isState,
    this.stateId,
    this.stateName,
    this.stateCode,
  });

  factory City.fromJson(Map<String, dynamic> data) {
    return City(
        id: data['id'],
        name: data['name'],
        countryId: data['country_id'],
        countryName: data['country_name'],
        countryFlagUrl: data['country_flag_url'],
        shouldExperimentWith: data['should_experiment_with'],
        hasGoOutTab: data['has_go_out_tab'],
        discoveryEnabled: data['discovery_enabled'],
        hasNewAdFormat: data['has_new_ad_format'],
        isState: data['is_state'],
        stateId: data['state_id'],
        stateName: data['state_name'],
        stateCode: data['state_code']);
  }
}

/// Gives the list of all cities.
class CityList {
  /// List Consisting of City Objects
  List<City> cities;

  CityList({this.cities});

  factory CityList.fromList(List<dynamic> cityList) {
    return CityList(
      cities: cityList.map((e) => City.fromJson(e)).toList(),
    );
  }
}

/// Represents the response object for Cities API
class CitiesResponse {
  CityList cityList;
  final status;
  final hasMore;
  final hasTotal;
  final userHasAddress;

  CitiesResponse(
      {this.cityList,
      this.hasMore,
      this.hasTotal,
      this.status,
      this.userHasAddress});

  factory CitiesResponse.fromJson(Map<String, dynamic> response) {
    return CitiesResponse(
        cityList: CityList.fromList(response['location_suggestions']),
        status: response['status'],
        hasMore: response['has_more'],
        hasTotal: response['has_total'],
        userHasAddress: response['user_has_addresses']);
  }
}
