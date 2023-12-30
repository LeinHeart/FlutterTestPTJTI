import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/constant.dart';
import 'package:get/get.dart';
import '../view/login_view.dart';

import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  LoginView? view;

  TextEditingController emailTxtCtrl = TextEditingController();
  TextEditingController pswdTxtCtrl = TextEditingController();

  void onLogin() async {
    // var url = Uri.parse('$API_URL/Auth');
    // var body = jsonEncode({
    //   "act": "LOGIN",
    //   "un": emailTxtCtrl.text,
    //   "up": pswdTxtCtrl.text,
    // });

    // try {
    //   final response = await http.post(url, body: body);
    //   print(response.body);
    // } catch (e) {
    //   print('$e');
    // }

    var url = Uri.parse('$API_URL/Auth/infoAja');
    try {
      final response = await http.get(url);
      print(response.body);
    } catch (e) {
      print('$e');
    }
  }

  @override
  void onInit() {
    emailTxtCtrl.text = "admin@admin.com";
    pswdTxtCtrl.text = "admin";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
