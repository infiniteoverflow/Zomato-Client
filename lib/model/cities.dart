class City {
  final id;
  final name;
  final countryId;
  final countryName;
  final countryFlagUrl;
  final shouldExperimentWith;
  final hasGoOutTab;
  final discoveryEnabled;
  final hasNewAdFormat;
  final isState;
  final stateId;
  final stateName;
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

class CityList {
  List<City> cities;

  CityList({this.cities});

  factory CityList.fromList(List<dynamic> cityList) {
    return CityList(
      cities: cityList.map((e) => City.fromJson(e)).toList(),
    );
  }
}

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
