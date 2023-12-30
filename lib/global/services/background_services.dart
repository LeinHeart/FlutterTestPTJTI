import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';

import 'package:http/http.dart' as http;

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: true,
      onStart: onStart,
      isForegroundMode: true,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  Timer.periodic(const Duration(seconds: 30), (timer) async {
    print('hit API');
    var url = Uri.parse('$API_URL/BgService/Hit');
    var headers = {'Content-Type': 'application/json'};

    var body = {
      "nama": "namanya",
      "email": "emailnya@mail.com",
      "nohp": "083333"
    };
    var request = http.Request('POST', url);
    request.body = json.encode(body);
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print('Hit API Success');
      } else {
        print("Hit API Failed");
      }
    } catch (e) {
      print("Hit API Failed.. $e");
    }
  });
}
