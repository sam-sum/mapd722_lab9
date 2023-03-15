import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Map<String, String> queryParameters = <String, String>{
      'q': cityName,
      'appid': 'f565f2905cd9baa3426ddf9309223c1d',
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    const Map<String, String> queryParameters = <String, String>{
      'lat': '43.78541',
      'lon': '-79.22818',
      'appid': 'f565f2905cd9baa3426ddf9309223c1d',
      'units': 'metric'
    };
    NetworkHelper networkHelper = NetworkHelper(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
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
