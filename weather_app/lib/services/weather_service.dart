import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {

  final String apiKey = "30610c3efae4b6b51023039716cb7fbd";

  Future<WeatherModel> getWeather(String city) async {

    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return WeatherModel.fromJson(data);

    } else {

      throw Exception("City not found");

    }
  }
}