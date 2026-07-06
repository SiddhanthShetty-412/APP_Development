import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel? weather;

  const WeatherCard({super.key, this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(
              weather == null
                  ? 'https://openweathermap.org/img/wn/01d@2x.png'
                  : 'https://openweathermap.org/img/wn/${weather!.icon}@2x.png',
              width: 100,
            ),
            const SizedBox(height: 15),
            Text(
              weather?.cityName ?? '',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${weather?.temperature ?? '--'} °C',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather?.condition ?? '',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.water_drop, color: Colors.blue),
                    const SizedBox(height: 5),
                    const Text('Humidity'),
                    Text('${weather?.humidity ?? '--'} %'),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.air, color: Colors.green),
                    const SizedBox(height: 5),
                    const Text('Wind'),
                    Text('${weather?.windSpeed ?? '--'} m/s'),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.thermostat, color: Colors.orange),
                    const SizedBox(height: 5),
                    const Text('Feels Like'),
                    Text('${weather?.feelsLike ?? '--'} °C'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
