import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widget/searchbar_widget.dart';
import '../widget/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cityController = TextEditingController();
  final WeatherService weatherService = WeatherService();
  WeatherModel? weather;
  String errorMessage = "";

  Future<void> searchWeather() async {
    try {
      final result = await weatherService.getWeather(cityController.text);
      setState(() {
        weather = result;
        errorMessage = "";
      });
    } catch (e) {
      setState(() {
        errorMessage = "City not found";
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.blue.shade100,
            appBar: AppBar(
                title: Text("Weather App"),
                centerTitle: true,
            ),
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    children:[
                        SearchBarWidget(
                          controller: cityController,
                          onPressed: searchWeather,
                        ),
                        SizedBox(height: 12),
                        if (errorMessage.isNotEmpty)
                          Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        SizedBox(height: 25),
                        WeatherCard(weather: weather),
                    ],
                ),
            ),
        );
    }
}
