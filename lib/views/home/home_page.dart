import 'package:flutter/material.dart';
import 'package:weather_station_iot_app/models/IotDevice.dart';
import 'package:weather_station_iot_app/views/home/repository/iot_device_http_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final iotDeviceHttpRepository = IotDeviceHttpRepository();
    return Scaffold(
      body: FutureBuilder<List<IotDevice>>(
          future: iotDeviceHttpRepository.findAllDevices(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading..'));
            } else {
              return DataTable(
                  columns: _createBookTableColumns(),
                  rows: _createBookTableRows(snapshot.data ?? []));
            }
          }),
    );
  }

  List<DataColumn> _createBookTableColumns() {
    return [
      const DataColumn(
          label: Text(
        'Serial Number',
      )),
      const DataColumn(label: Text('Device')),
      const DataColumn(label: Text('Temperature')),
    ];
  }

  List<DataRow> _createBookTableRows(List<IotDevice> iotdevices) {
    return iotdevices
        .map((iotdevice) => DataRow(cells: [
              DataCell(Text(iotdevice.serialNumber.toString())),
              DataCell(Text(iotdevice.device.toString())),
              DataCell(Text(iotdevice.temperature.toString())),
            ]))
        .toList();
  }
}
