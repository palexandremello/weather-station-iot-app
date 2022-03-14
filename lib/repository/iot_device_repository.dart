import 'package:weather_station_iot_app/models/IotDevice.dart';

abstract class IotDeviceRepository {
  Future<void> findAllDevices();
}
