import 'package:clima/screens/error_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  void getLocationData() async {
    try {
      Map<String, dynamic> weatherData = await WeatherModel().getLocationWeather();
      Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)));
    } catch (e) {
      print('error: $e');
      Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(error: e)));
    }
  }
}
