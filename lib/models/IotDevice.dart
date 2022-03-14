import 'dart:convert';
import 'dart:core';

import 'package:flutter/widgets.dart';

class IotDevice with ChangeNotifier {
  String device;
  DateTime timestamp;
  double humidity;
  double temperature;
  String serialNumber;
  String type;

  IotDevice({
    required this.device,
    required this.timestamp,
    required this.humidity,
    required this.temperature,
    required this.serialNumber,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'device': device,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'humidity': humidity,
      'temperature': temperature,
      'serialNumber': serialNumber,
      'type': type,
    };
  }

  factory IotDevice.fromMap(Map<String, dynamic> map) {
    return IotDevice(
      device: map['device'] ?? '',
      timestamp: DateTime.parse(map['timestamp']),
      humidity: map['humidity']?.toDouble() ?? 0.0,
      temperature: map['temperature']?.toDouble() ?? 0.0,
      serialNumber: map['serialNumber'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IotDevice.fromJson(String source) =>
      IotDevice.fromMap(json.decode(source));
}
