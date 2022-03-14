import 'package:flutter/widgets.dart';
import 'package:weather_station_iot_app/models/IotDevice.dart';
import 'package:weather_station_iot_app/views/home/repository/iot_device_repository.dart';

class IotDeviceProvider extends ChangeNotifier {
  late List<IotDevice> data;
  bool loading = false;

  getIotDevicesData(context) async {
    loading = true;
    data = await IotDeviceHttpRepository().findAllDevices();
    loading = false;

    notifyListeners();
  }
}
