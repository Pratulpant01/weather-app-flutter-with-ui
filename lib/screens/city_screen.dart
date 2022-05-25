import 'package:flutter/material.dart';
import 'package:weather_app_with_ui/constants/constants.dart';
import 'package:weather_app_with_ui/services/weather.dart';

class CityScreen extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  String cityName = " ";

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherModel();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              city_text_field(widget: widget),
              FlatButton(
                onPressed: () {
                  widget.cityName = widget.textEditingController.text;
                  Navigator.pop(context, widget.cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class city_text_field extends StatelessWidget {
  const city_text_field({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CityScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: widget.textEditingController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          icon: Icon(
            Icons.house,
            color: Colors.white,
            size: 35,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          hintText: "Enter your City",
          hintStyle: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}