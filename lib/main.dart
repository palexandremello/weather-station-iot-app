import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_station_iot_app/providers/iot_device_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_station_iot_app/views/home/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<IotDeviceProvider>(create: (_) => IotDeviceProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your appleication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
