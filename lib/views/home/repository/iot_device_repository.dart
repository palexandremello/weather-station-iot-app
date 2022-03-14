import 'dart:convert';
import 'package:weather_station_iot_app/models/IotDevice.dart';
import 'package:weather_station_iot_app/repository/iot_device_repository.dart';
import 'package:http/http.dart' as http;

class IotDeviceHttpRepository implements IotDeviceRepository {
  @override
  Future<List<IotDevice>> findAllDevices() async {
    const baseUrl = "https://9cyutdyhgf.execute-api.us-east-2.amazonaws.com/v1";
    final url = Uri.parse('$baseUrl/catalog');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        final List<dynamic> parsed = json.decode(response.body);
        return parsed.map((device) => IotDevice.fromMap(device)).toList();
      } catch (error) {
        throw Exception(error.toString());
      }
    }

    throw Exception("Failed to load IOT DEVICE ENDPOINT");
  }
}
