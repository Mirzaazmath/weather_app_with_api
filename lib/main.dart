import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_api/presentation/home_screen.dart';
import 'package:weather_app_with_api/provider/weather_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Setting DeviceOrientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wraping MaterialApp with ChangeNotifierProvider for StateManagement
    // using ChangeNotifierProvider for single Provider
    return ChangeNotifierProvider(
      create: (BuildContext context) => FetchWeatherDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff191a1e),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
