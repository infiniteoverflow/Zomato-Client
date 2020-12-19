library zomato_client;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:zomato_client/model/categories.dart';
import 'package:zomato_client/model/cities.dart';
import 'package:zomato_client/model/collections.dart';
import 'package:zomato_client/model/cuisines.dart';

/// A Dart class to get all the endpoints of the Zomato API.
class Zomato {

  // The Zomato API Key
  String key;

  Zomato({@required this.key}):assert(key!=null);

  // Returns the category list
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

  // Find the Zomato ID and other details for a city .
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

  // Returns Zomato Restaurant Collections in a City.
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

    if(jsonData.containsKey('code')) return "badRequest";
    else {
      if(asObject == true) return Collections.fromList(json.decode(response.body)['collections']);
      else return json.decode(response.body);
    }
  }

  // Get a list of all cuisines of restaurants listed in a city.
  Future getCuisines({String lat,String long,int cityId,int count,bool asObject = false}) async{
    var api = 'https://developers.zomato.com/api/v2.1/cuisines';
    
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

    if(jsonData.containsKey('code')) return "badRequest";
    else {
      if(asObject == true) return Cuisines.fromList(json.decode(response.body)['cuisines']);
      else return json.decode(response.body);
    }
  }
}
