library zomato_client;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:zomato_client/model/categories.dart';
import 'package:zomato_client/model/cities.dart';
import 'package:zomato_client/model/collections.dart';
import 'package:zomato_client/model/cuisines.dart';
import 'package:zomato_client/model/dailyMenu.dart';
import 'package:zomato_client/model/establishment.dart';
import 'package:zomato_client/model/geocode.dart';
import 'package:zomato_client/model/locationDetails.dart';
import 'package:zomato_client/model/locations.dart' as loc;

/// A Dart class to get all the endpoints of the Zomato API.
class Zomato {

  /// The Zomato API Key
  String key;

  Zomato({@required this.key}):assert(key!=null);

  /// Returns the category list
  Future getCategories({bool asObject = false}) async {

    String categoryUrl = 'https://developers.zomato.com/api/v2.1/categories';
  
    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(categoryUrl, headers: headers,);

    if(asObject) return Categories.fromList(json.decode(response.body)['categories']);
    return json.decode(response.body);
  }

  /// Find the Zomato ID and other details for a city .
  Future getCityDetails({String q,String lat,String long,String cityIds,int count,bool asObject = false}) async {
    var api = 'https://developers.zomato.com/api/v2.1/cities';

    if(q!=null) api+='?q=$q';
    else if(lat != null && long !=null) api+="?lat=$lat&long=$long";
    else if(cityIds!=null) {
      cityIds.replaceAll(",", "%2c");
      api+="?city_ids=$cityIds";
    }
    if(count != null) {
      if(api.contains("?")) api+="&count=$count";
      else api+="?count=$count";
    }

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(api, headers: headers,);

    if(asObject == true) {
      CitiesResponse citiesResponse = CitiesResponse.fromJson(json.decode(response.body));
      return citiesResponse;
    }
    return json.decode(response.body);
  }

  /// Returns Zomato Restaurant Collections in a City.
  Future getCollections({String lat,String long,int cityId,int count,bool asObject = false}) async {
    var api = 'https://developers.zomato.com/api/v2.1/collections';
    
    if(cityId!=null) api+="?city_id=$cityId";
    else if(lat != null && long !=null) api+="?lat=$lat&long=$long";
    if(count != null) {
      if(api.contains("?")) api+="&count=$count";
      else api+="?count=$count";
    }

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return Collections.fromList(json.decode(response.body)['collections']);
      else return json.decode(response.body);
    }
  }

  /// Get a list of all cuisines of restaurants listed in a city.
  Future getCuisines({String lat,String long,int cityId,bool asObject = false}) async{
    var api = 'https://developers.zomato.com/api/v2.1/cuisines';
    
    if(cityId!=null) api+="?city_id=$cityId";
    else if(lat != null && long !=null) api+="?lat=$lat&long=$long";

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return Cuisines.fromList(json.decode(response.body)['cuisines']);
      else return json.decode(response.body);
    }
  }

  /// Get a list of restaurant types in a city.
  Future getEstablishment({String lat,String long,int cityId,bool asObject = false}) async {
    var api = 'https://developers.zomato.com/api/v2.1/establishments';
    
    if(cityId!=null) api+="?city_id=$cityId";
    else if(lat != null && long !=null) api+="?lat=$lat&long=$long";

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return Establishments.fromList(json.decode(response.body)['establishments']);
      else return json.decode(response.body);
    }
  }

  /// Get Foodie and Nightlife Index, list of popular cuisines and nearby restaurants around the given coordinates.
  Future getGeocode({@required double lat , @required double long , bool asObject}) async {
    assert(lat!=null);
    assert(long!=null);
    
    var api = 'https://developers.zomato.com/api/v2.1/geocode?lat=$lat&lon=$long';
    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return GeoCode.fromJson(json.decode(response.body));
      else return json.decode(response.body);
    }
  }

  /// Search for Zomato locations by keyword. Provide coordinates to get better search results
  Future getLocation({@required String place,double lat,double long,int count,bool asObject}) async{

    assert(place!=null);

    var api = 'https://developers.zomato.com/api/v2.1/locations?query=$place';

    if(lat != null) api+='&lat=$lat';
    if(long != null) api+='&lon=$long';

    if(count!=null) api+='&count=$count';

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };

    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return loc.Location.fromJson(json.decode(response.body));
      else return json.decode(response.body);
    }
  }

  /// Get Foodie Index, Nightlife Index, Top Cuisines and Best rated restaurants in a given location
  Future getLocationDetails({@required String entityType , @required int entityId,bool asObject}) async {

    assert(entityId!=null);
    assert(entityType!=null);

    var api = 'https://developers.zomato.com/api/v2.1/location_details?entity_id=$entityId&entity_type=$entityType';

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };

    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return LocationDetails.fromJson(json.decode(response.body));
      else return json.decode(response.body);
    }
  }

  /// Get daily menu using Zomato restaurant ID.
  Future getDailyMenus({@required resId,bool asObject}) async{
    assert(resId!=null);

    var api = 'https://developers.zomato.com/api/v2.1/dailymenu?res_id=$resId';

    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };

    final response = await http.get(api, headers: headers,);

    Map<String,dynamic> jsonData = json.decode(response.body);

    if(jsonData.containsKey('code')) return jsonData['message'];
    else {
      if(asObject == true) return DailyMenuList.fromList(json.decode(response.body)['daily_menus']);
      else return json.decode(response.body);
    }
  }
}
