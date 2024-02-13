import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/weather_model.dart';
import '../provider/weather_provider.dart';
import '../utils/index_finder.dart';
import '../utils/weather_report.dart';
import '../widgets/error_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Calling fetchApiData method using provider
      Provider.of<FetchWeatherDataProvider>(context, listen: false)
          .fetchApiData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      // Using  Consumer to update UI Based on response
      child: Consumer<FetchWeatherDataProvider>(
          builder: (BuildContext context, provider, Widget? child) {
        // if the response is success
        if (provider.requestState == LoadingState.success) {
          WeatherModel weatherdata = provider.weatherData;
          int currentIndex = indexFinder(weatherdata.daily!.time!,
              "${DateTime.now().year}-${DateTime.now().month < 10 ? "0${DateTime.now().month}" : DateTime.now().month}-${DateTime.now().day}");

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      weatherdata.timezone ?? "NA",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    height: 230,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Color(0xff45433d), blurRadius: 100)
                        ]),
                    child: Image.asset(weatherReportImage(weatherdata
                        .daily!.weathercode![currentIndex]
                        .toInt()))),
                Text(
                  "${weatherdata.current!.temperature2m}${weatherdata.currentUnits!.temperature2m}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherReport(
                      weatherdata.daily!.weathercode![currentIndex].toInt()),
                  style: const TextStyle(
                      color: Color(0xff85868a),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff24252a),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.air,
                            color: Color(0xff65695d),
                          ),
                          Text(
                            "13 Km/h",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Wind",
                            style: TextStyle(
                                color: Color(0xff85868a),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                          ),
                          Text(
                            "24%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Humidity",
                            style: TextStyle(
                                color: Color(0xff85868a),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.water,
                            color: Colors.white,
                          ),
                          Text(
                            "87%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(
                                color: Color(0xff85868a),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "10 days ",
                        style: TextStyle(
                            color: Color(0xff85868a),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: weatherdata.daily?.time?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // bool currentDate =
                          //     weatherdata.daily?.time![index].split("-").last ==
                          //         "${DateTime.now().day}";
                          return Container(
                              padding: const EdgeInsets.all(15),
                              height: 130,
                              width: 80,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff1f2427),
                                  borderRadius: BorderRadius.circular(25),
                                  border:
                                      Border.all(color: Colors.grey.shade800),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: currentIndex==index
                                          ? const [
                                              Color(0xff4cb8f4),
                                              Color(0xff3782f4),
                                            ]
                                          : const [
                                              Color(0xff1f2427),
                                              Color(0xff1f2427),
                                            ])),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    weatherdata.daily?.time![index]
                                            .split("-")
                                            .last ??
                                        "NA",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: Image.asset(weatherReportImage(
                                        weatherdata.daily!.weathercode![index]
                                            .toInt())),
                                  ),
                                  Text(
                                    "12:00",
                                    style: TextStyle(
                                        color: currentIndex==index
                                            ? Colors.white
                                            : const Color(0xff85868a),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ));
                        }),
                  ),
                ),
              ],
            ),
          );
          // if any error occur
        } else if (provider.requestState == LoadingState.error) {
          return const ErrorCard();
        }
        // for loading
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    ));
  }
}
