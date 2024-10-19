import 'package:clima/Models/WeatherModel.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, required this.location});

  final Position location;

  WeatherModel Model = WeatherModel();
  WeatherService weatherService = WeatherService();

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position?> _determinePosition() async {
    try {
      return await Location().DeterminePosition();
    } catch (e) {
      print('Error getting location: $e');
      return null;
      // Consider showing an error message to the user here.
      // You might use a SnackBar or aDialog.
    }
  }

  Future<void> _DisplayData(dynamic? data) async {
    if (data == null) {
      data = await widget.weatherService.getWeatherByPosition(widget.location);
    }

    setState(() {
      if (data == null) {
        widget.Model.temperature = 0;
        widget.Model.weatherIcon = 'Error';
        widget.Model.weatherMessage = 'Unable to get weather data';
        widget.Model.cityName = '';
      } else {
        double temp = data['main']['temp'];
        widget.Model.temperature = temp.toInt();

        var condition = data['weather'][0]['id'];
        widget.Model.weatherIcon =
            widget.weatherService.getWeatherIcon(condition);
        widget.Model.weatherMessage =
            widget.weatherService.getMessage(widget.Model.temperature);
        widget.Model.cityName = data['name'];
      }
    });
  }

  @override
  void initState() {
    _DisplayData(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () async {
                        Position? position = await _determinePosition();
                        if (position != null) {
                          var data = await widget.weatherService
                              .getWeatherByPosition(position);
                          _DisplayData(data);
                        }
                      },
                      icon: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        // Navigate only if the widget is still mounted.
                        if (mounted) {
                          var data = await Navigator.pushNamed(
                              context, '/$KCityScreen');
                          if (data != null) {
                            _DisplayData(data);
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${widget.Model.temperature}°',
                        style: kTempTextStyle,
                      ),
                      const Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    "${widget.Model.weatherMessage} in ${widget.Model.cityName}!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
