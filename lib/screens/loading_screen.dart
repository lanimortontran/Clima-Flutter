import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String apiKey = '9f5d4477a90bf530e3933badbdb338ef';

  double latitude;
  double longitude;

  @override
  void initState() {
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    Map<String, dynamic> weatherData = await networkHelper.getData();

    double temp = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];
    String city = weatherData['name'];

    print('temp: $temp');
    print('condition: $condition');
    print('city: $city');
  }
}
