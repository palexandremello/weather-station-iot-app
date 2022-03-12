import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_station_iot_app/models/IotDevice.dart';

class HttpRequest {
  Future<List<IotDevice>> getDevicesData(String endpoint) async {
    const baseUrl = "https://9cyutdyhgf.execute-api.us-east-2.amazonaws.com/v1";
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed['body']
          .map((device) => IotDevice.fromJson(device))
          .toList();
    }

    return throw Exception("Failed to load IOT DEVICE ENDPOINT");
  }
}
