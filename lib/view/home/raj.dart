import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:weather_stream/data/model/city_detail.dart';

class City_Main extends StatelessWidget {
  City_Main(
      {Key? key,
      required this.city_mainn,
      required this.wind,
      required this.city_weather})
      : super(key: key);
  Main city_mainn;
  Wind wind;
  List<CIty_Weather> city_weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Row(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      city_mainn.temp.toInt().toString() + '°',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 22,
                              ),
                              Center(
                                child: Text(
                                  city_mainn.tempMax.toString() + ' low',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                size: 22,
                              ),
                              Text(
                                city_mainn.tempMin.toString() + ' high',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: SlidingSwitch(
                        value: false,
                        width: 100,
                        onChanged: (bool value) {
                          print(value);
                        },
                        height: 35,
                        animationDuration: const Duration(milliseconds: 200),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "°C",
                        textOn: "°F",
                        colorOn: Colors.black,
                        colorOff: Colors.black,
                        background: Colors.amber,
                        buttonColor: Colors.lightBlue,
                        inactiveColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.deepPurpleAccent),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.water_drop,
                                  size: 26,
                                  color: Colors.white,
                                ),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              'Percipation',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Icon(
                                    Icons.flag,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  wind.speed.toString() + 'm/s',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              'Wind',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop_outlined,
                                  size: 26,
                                ),
                                Text(
                                  city_mainn.humidity.toString() + '%',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              'Humidity',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: Colors.white,
                                ),
                                Text(
                                  '.0029MPH',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                            Text(
                              'Direction',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
