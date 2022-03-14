import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_station_iot_app/providers/iot_device_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final iotDevices = Provider.of<IotDeviceProvider>(context, listen: false);
    iotDevices.getIotDevicesData(context);
  }

  @override
  Widget build(BuildContext context) {
    final iotDevices = Provider.of<IotDeviceProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("IOT DEVICES"),
        ),
        body: SafeArea(
          child: PageView(
            children: <Widget>[
              PieChart(
                PieChartData(
                  sections: data,
                  centerSpaceRadius: 45,
                  sectionsSpace: 10,
                ),
              )
            ],
          ),
        ));
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: "A", color: Colors.red),
  PieChartSectionData(title: "B", color: Colors.blue),
  PieChartSectionData(title: "C", color: Colors.yellow),
  PieChartSectionData(title: "D", color: Colors.green)
];
