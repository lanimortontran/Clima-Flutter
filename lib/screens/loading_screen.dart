import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  }
}
