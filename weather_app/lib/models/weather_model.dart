class WeatherModel {
  final String cityName;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double feelsLike;
  final String icon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}