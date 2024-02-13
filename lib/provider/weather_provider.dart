import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/weather_model.dart';
import '../servies/network_services.dart';

// Create an Enum to handle api calling state
enum LoadingState { initial, loading, success, error }

class FetchWeatherDataProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  // default state
  var _requestState = LoadingState.initial;
  get weatherData => _weatherData;
  get requestState => _requestState;

  ///// fetch data /////////
  void fetchApiData() async {
    // Loading state
    _requestState = LoadingState.loading;
    notifyListeners();
    try {
      final NetworkServices apiService = NetworkServices();
      String url =
          'latitude=52.52&longitude=13.41&current=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto&past_days=3';
      Response response = await apiService.getResponse(url);
      if (response.statusCode == 200) {
        _weatherData = WeatherModel.fromJson(jsonDecode(response.body));
        debugPrint(weatherData.toString());
        // sucess state
        _requestState = LoadingState.success;
        notifyListeners();
      }
    } catch (error) {
      // error state
      _requestState = LoadingState.error;
      notifyListeners();
      debugPrint("Error While fetching the weather response  data === $error");
    }
  }
}
