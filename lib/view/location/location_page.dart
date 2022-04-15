import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:background_location/background_location.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            Center(
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  height: 300,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      Text(
                        'Search your Location',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              'Search and get real time weather information of your Location',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      FlatButton(
                        color: Colors.deepOrange,
                        child: Text(
                          'Search your Location',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Expanded(
// child: SizedBox(
// width: double.infinity,
// child: FlatButton(
// onPressed: () {
// playSound(1);
// },
// color: Colors.blue,
// ),
