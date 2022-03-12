import 'package:get/get.dart';

import 'package:weather_station_iot_app/repository/iot_device_repository.dart';

class HttpController extends GetxController with StateMixin {
  final IotDeviceRepository httpRepository;
  HttpController({
    required this.httpRepository,
  });

  @override
  void onInit() {
    super.onInit();
    findAllDevices();
  }

  void findAllDevices() async {
    change([], status: RxStatus.loading());
    try {
      final devices = await httpRepository.findAllDevices();
      change(devices, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }
}
