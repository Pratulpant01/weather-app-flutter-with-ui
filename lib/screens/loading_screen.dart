import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_with_ui/screens/location_screen.dart';
import 'package:weather_app_with_ui/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_with_ui/services/weather.dart';

import '../services/location.dart';

double? latitude;
double? longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                loactionWeather: weatherData,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}



// https://api.openweathermap.org/data/2.5/weather?lat=29.071899&lon=80.112701&appid=80b5cde93eaf08209876458a3425b7cd