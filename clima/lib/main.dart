import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/$KCityScreen': (context) => CityScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/$KLocationScreen') {
          final args = settings.arguments as Position;
          return MaterialPageRoute(
            builder: (context) => LocationScreen(location: args),
          );
        }
      },
    );
  }
}
