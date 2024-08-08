import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  Future<void> getLocation()async{
    try{
      LocationPermission permission = await Geolocator.checkPermission();

      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      print(position);
    }catch (e) {
      // Handle errors that might occur
      print('Error: getLocation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
