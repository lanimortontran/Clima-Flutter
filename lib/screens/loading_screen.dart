import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
  @override
  void initState() {
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('latitude: ${location.latitude}');
    print('longitude: ${location.longitude}');
    getData(location.latitude, location.longitude);
  }

  Future<void> getData(lat, lon) async {
    print('getting weather data...');
    String apiKey = 'e1c3d91cf2f873de37430cb956c8a7aa';
    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    print('URL: $url');
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
