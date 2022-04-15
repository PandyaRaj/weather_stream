import 'package:flutter/material.dart';
import 'package:weather_stream/data/model/city_detail.dart';
import 'package:weather_stream/view/home/city_card.dart';
import 'package:weather_stream/view/home/city_time.dart';
import 'package:weather_stream/view/home/drawer.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:weather_stream/view/home/cardbox.dart';
import 'package:weather_stream/view/home/raj.dart';
import 'package:weather_stream/view/home/settings.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../data/api/api_helper.dart';
import '../../data/model/city_weather_detail.dart';
import 'city_time.dart';

ApiHelper api = ApiHelper();

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.lon, required this.lat}) : super(key: key);
  final double lat;
  final double lon;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Position _currentPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<City_Detail>(
      future: api.fetchDoc(widget.lat, widget.lon),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('empty raj');
          print(snapshot.data!.name);
          return SafeArea(
            child: Scaffold(
              drawer: DrawerScreen(),
              endDrawer: SettingsScreen(),
              appBar: PreferredSize(
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            size: 32,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data!.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Icon(
                            Icons.settings,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(90),
              ),
              // backgroundColor: Hexcolor('#e9f1fe'),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Time(
                      city_time: snapshot.data!.sys,
                      date: snapshot.data!.dt,
                      city_weather: snapshot.data!.city_weather,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    City_Main(
                      wind: snapshot.data!.wind,
                      city_mainn: snapshot.data!.main,
                      city_weather: snapshot.data!.city_weather,
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              bottom: 4.0, top: 5, left: 10),
                          height: 140.0,
                          child: FutureBuilder<City_Weather>(
                            future: api.fetchDocList(widget.lat, widget.lon),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                print('wather has no data');
                                return Container(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return City_Card(
                                          city_card:
                                              snapshot.data!.weather_lisst);
                                    },
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              print('raj raj ');
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          print('not data');
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
