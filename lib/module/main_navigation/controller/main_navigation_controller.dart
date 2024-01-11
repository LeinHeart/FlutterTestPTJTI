import 'dart:convert';
import 'dart:io';

import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/constant.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/currency_type.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:get/get.dart';
import '../view/main_navigation_view.dart';

import 'package:http/http.dart' as http;

class MainNavigationController extends GetxController {
  static MainNavigationController get instance => Get.find();
  MainNavigationView? view;

  var isLoading = true.obs;

  Outlet? outlet;
  List<CurrencyType> currencyTypes = [];
  User? userData;
  List<OutletListItem> outletListItems = [];

  late Map<String, dynamic> response;

  login() async {
    var url = Uri.parse('$API_URL/Auth');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'ci_session=d73ddaea20dcd834102cd439b56299fb0850cf19; csrf_cookie_name=e0d9b2f84776e79246cb0b274011579c'
    };
    var body = {"act": "LOGIN", "un": "admin@admin.com", "up": "admin"};
    var request = http.Request('POST', url);
    request.body = json.encode(body);
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      var responseJson = json.decode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        userData = User.fromJson(responseJson['data']['user']);
      }
    } catch (e) {
      print('$e');
    }
  }

  getInitData() async {
    var url = Uri.parse('$API_URL/Auth/initData');

    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'ci_session=de447459dd88e746854dc3fb19762733fadeb95d; csrf_cookie_name=3b95f79a346ebf397bc33d5388f3b6db'
    };

    var body = {"act": "initData", "outlet_id": 1};

    var request = http.Request('GET', url);
    request.body = json.encode(body);
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      var responseJson = json.decode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        // -- Set Outlet
        outlet = Outlet.fromJson(responseJson['data']);
        outletListItems.add(
            OutletListItem(id: outlet!.id, outletName: outlet!.outletName));

        for (SubOutlet subOutlet in outlet!.outletSubs) {
          outletListItems.add(OutletListItem(
              id: subOutlet.id, outletName: subOutlet.outletName));
        }

        // -- Set Currency
        currencyTypes =
            CurrencyType.fromJsonArray(responseJson['data']['cur_tipe']);
      } else {
        // --- Status Code Check
        throw Exception('Request Error: ${response.statusCode}');
      }
    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    } catch (e) {
      print('Error : $e');
    }
  }

  initialize() async {
    await login();
    await getInitData();
    response = {
      "outlets": outletListItems,
      "currencies": currencyTypes,
    };
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    initialize();
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
