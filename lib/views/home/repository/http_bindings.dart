import 'package:get/get.dart';
import 'package:weather_station_iot_app/repository/iot_device_repository.dart';
import 'package:weather_station_iot_app/views/home/repository/http_controller.dart';
import 'package:weather_station_iot_app/views/home/repository/iot_device_http_repository.dart';

class HttpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IotDeviceRepository>(IotDeviceHttpRepository());
    Get.put(HttpController(httpRepository: Get.find()));
  }
}
