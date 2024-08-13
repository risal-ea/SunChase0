import 'package:flutter/material.dart';
import 'package:sun_chase0/services/location.dart';
import 'package:sun_chase0/services/networking.dart';

const apiKey = {YOUR API KEY};

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData()  {
    Location location = Location();
    location.getCurrentlocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetWorkHelper netWorkHelper = NetWorkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'
    );

    var weatherData = netWorkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
