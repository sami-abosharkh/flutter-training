import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart'; // Rename SD.dart to constants.dart for clarity
import 'package:geolocator/geolocator.dart';

class WeatherService {
  // Use lowercase for method names to follow Dart conventions
  Future<dynamic> getWeatherByPosition(Position position) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherBaseURL?lat=${position.latitude}&lon=${position.longitude}&appid=$openWeatherAPIKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherByCity(String city) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherBaseURL?q=$city&appid=$openWeatherAPIKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Consider using an enum ora map for better readability and maintainability
  String getWeatherIcon(int condition) {
    switch (condition ~/ 100) {
      // Use integer division for broader condition ranges
      case 2:
        return '🌩';
      case 3:
        return '🌧';
      case 5:
        return '☔️';
      case 6:
        return '☃️';
      case 7:
        return '🌫';
      case 8:
        if (condition == 800) {
          return '☀️';
        } else if (condition <= 804) {
          return '☁️';
        }
        break;
      default:
        return '🤷‍';
    }
    return '🤷‍'; // Handle the default case explicitly
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
