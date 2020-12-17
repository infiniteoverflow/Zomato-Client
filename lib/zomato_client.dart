library zomato_client;

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

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

    return response.body;
  }

  
}
