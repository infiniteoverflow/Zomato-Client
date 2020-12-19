library zomato_client;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:zomato_client/model/categories.dart';

/// A Dart class to get all the endpoints of the Zomato API.
class Zomato {

  // The Zomato API Key
  String key;

  Zomato({@required this.key});

  // Returns the category list
  Future getCategories({bool asObject = false}) async {

    String categoryUrl = 'https://developers.zomato.com/api/v2.1/categories';
  
    final headers = {
      'Content-Type': 'application/json',
      "user-key": this.key,
    };
    final response = await http.get(categoryUrl, headers: headers,);

    if(asObject) return Categories.fromList(json.decode(response.body)['categories']);
    return response.body;
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

    return response.body;
  }

}
