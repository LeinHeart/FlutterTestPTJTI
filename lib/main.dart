import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/services/background_services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeBackgroundService();

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigationView(),
    ),
  );
}
