import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_stream/view/home/home.dart';
// import 'package:background_location/background_location.dart';
import '../location/location_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  String currentAddress = "";
  bool? complete;
  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = p[0];
      print("latitude");
      print(_currentPosition!.latitude);
      print('!!!!!!!!!!!!!!!!!!!!');
      print(_currentPosition!.longitude);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(
                lat: _currentPosition!.latitude,
                lon: _currentPosition!.longitude),
          ),
        );
        currentAddress =
            "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
      });
      print("address");
      print(currentAddress);
    } catch (e) {
      print(e);
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('location services are disable');
      await Geolocator.openLocationSettings();
      complete = false;
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print("permission denied");
        await Geolocator.openLocationSettings();
        complete = false;

        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
      print("forever Denied");
      await openAppSettings();
      complete = false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    complete = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Search()),
    );
    print("location");
    return getCurrentLocation();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Get weather info with superior accuracy',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Container(
// decoration: BoxDecoration(
// color: Theme.of(context).canvasColor,
// ),
// padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// child: Column(
// children: <Widget>[
// Row(
// children: <Widget>[
// Icon(Icons.location_on),
// SizedBox(
// width: 8,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// ElevatedButton(
// child: Text(
// 'Get Location',
// style: Theme.of(context).textTheme.caption,
// ),
// onPressed: () async {
// if (await _determinePosition()) {
// getCurrentLocation();
// }
// },
// ),
// if (_currentPosition != null &&
// currentAddress != null)
// Text(currentAddress,
// style: TextStyle(fontSize: 20.0))
// else
// Text("Could'nt fetch the location"),
// ],
// ),
// ),
// SizedBox(
// width: 8,
// ),
// ],
// ),
// ],
// ))
// ],
// ),
