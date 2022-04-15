import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:weather_stream/data/model/city_detail.dart';

import '../model/city_weather_detail.dart';

String url = 'https://api.openweathermap.org/data/2.5/';

class ApiHelper {
  Future<City_Detail> fetchDoc(double lat, double lon) async {
    print('api is calling');
    final response = await http.get(
      Uri.parse('$url' + 'weather?lat=$lat&lon=$lon&units=metric&'),
      // Send authorization headers to the backend.
      headers: {
        'x-api-key': '96c43fadb75c94b95081c34d056723bb',
      },
    );
    print(response.body);
    // var url = Uri.parse(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=');
    if (response.statusCode == 200) {
      City_Detail product = City_Detail.fromJson(jsonDecode(response.body));
      print("product");
      print(product);
      return product;
    } else {
      print(response.body);
      throw Exception('Unexpected error occured!');
    }
  }

  Future<City_Weather> fetchDocList(double lat, double lon) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=96c43fadb75c94b95081c34d056723bb');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      City_Weather userresponse =
          City_Weather.fromJson(jsonDecode(response.body));
      print("userresponse");
      print(userresponse);
      return userresponse;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
