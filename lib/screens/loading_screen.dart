import 'package:flutter/material.dart';
import 'package:sun_chase0/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }

  void getLocation(){
    Location location = Location();
    location.getCurrentlocation();
  }

  void getData()async{
    http.Response response = await http.get(
    Uri.parse('https://openweathermap.org/api/geocoding-api#reverse_example')
    );
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
