import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  final String cityName;
  final double temperature;

  WeatherData({
    required this.cityName,
    required this.temperature,
  });
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherData? _weatherData;

  Future<WeatherData> _fetchWeatherData(String cityName) async {
    final apiKey = '35960bc7a8a0059dbf14cd3945b33ed8';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final temperature = jsonResponse['main']['temp'];
      return WeatherData(cityName: cityName, temperature: temperature);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void _getWeatherData() async {
    try {
      final weatherData = await _fetchWeatherData('London');
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Center(
        child: _weatherData == null
            ? CircularProgressIndicator()
            : Text(
                '${_weatherData!.cityName}: ${_weatherData!.temperature}°C',
                style: TextStyle(fontSize: 24),
              ),
      ),
    );
  }
}

// class AI extends StatefulWidget {
//   const AI({Key? key}) : super(key: key);
//   @override
//   State<AI> createState() => _AI();
// }

// class _AI extends State<AI> {
//   final String apiUrl = ' https://jsonplaceholder.typicode.com/';
//   List<dynamic> _posts = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchPosts();
//   }

//   Future<void> _fetchPosts() async {
//     final response = await http.get(Uri.parse(apiUrl));
//     final responseData = json.decode(response.body);
//     setState(() {
//       _posts = responseData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AI Posts'),
//       ),
//       body: ListView.builder(
//         itemCount: _posts.length,
//         itemBuilder: (BuildContext context, int index) {
//           final post = _posts[index];
//           return ListTile(
//             title: Text(post['title']),
//             subtitle: Text(post['body']),
//           );
//         },
//       ),
//     );
//   }
// }
