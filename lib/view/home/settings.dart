import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue[50],
      ),
      child: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13.0, bottom: 8),
              child: Text(
                'UNIT & TEMPRATURE',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Tempreature',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SlidingSwitch(
              value: false,
              width: 180,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0, top: 14, left: 15),
              child: Text(
                'About US',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0, top: 14, left: 15),
              child: Text(
                'Rate US',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0, top: 14, left: 15),
              child: Text(
                'Weather dat',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0, top: 14, left: 15),
              child: Text(
                'Share',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 13.0, top: 14, left: 15),
              child: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 85.0, top: 14, left: 15),
              child: Text(
                'check other app',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 1, left: 15),
                child: Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 13.0, left: 15),
                child: Text(
                  'A QUIXOM product',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
