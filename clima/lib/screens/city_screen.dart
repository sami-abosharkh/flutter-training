import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class CityScreen extends StatefulWidget {
  CityScreen({super.key});

  WeatherService weatherService = WeatherService();

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black), // Set text color
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Set background color
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                    hintStyle: TextStyle(color: Colors.grey), // Set text color
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (cityName != "") {
                    var data =
                        await widget.weatherService.getWeatherByCity(cityName);
                    if (data != null) {
                      Navigator.pop(context, data);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter a correct city!'),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter a city!'),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
                child: const Text(
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
