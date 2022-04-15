import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import '../../data/model/city_detail.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_icons/weather_icons.dart';

String parseTimeStamp(int value) {
  var date = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var d12 = DateFormat('EEEE, MMMM dd,yyyy').format(date);
  return d12;
}

class Time extends StatelessWidget {
  Time(
      {Key? key,
      required this.city_time,
      required this.date,
      required this.city_weather})
      : super(key: key);
  Sys city_time;
  List<CIty_Weather> city_weather;
  int date;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(
          city_time.country,
          style: TextStyle(fontSize: 23),
        )),
        Center(
          child: Text(
            parseTimeStamp(date),
            style: TextStyle(
                fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ),
        Icon(
          WeatherIcons.fromString(city_weather[0].icon.toString(),
              // Fallback is optional, throws if not found, and not supplied.
              fallback: WeatherIcons.na),
          size: 100,
        ),
        // Icon(
        //   Icon(IconData(
        //     city_weather[0].icon.toString(),
        //     fontFamily: 'MaterialIcons',
        //   )),
        //   size: 100,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            city_weather[0].description,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
