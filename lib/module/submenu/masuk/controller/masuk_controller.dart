import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/currency_type.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:get/get.dart';
import '../view/masuk_view.dart';

class MasukController extends GetxController {
  static MasukController get instance => Get.find();

  dynamic argumentData = Get.arguments;
  MasukView? view;

  var isSelectingOutlet = false.obs;

  late List<OutletListItem> outletListItems;
  OutletListItem? selectedOutlet;

  late List<CurrencyType> currencyList;
  CurrencyType? selectedCurrency;

  updateSelectedOutlet(OutletListItem value) {
    selectedOutlet = value;
    update();
  }

  updateIsSelectingOutlet(bool value) {
    isSelectingOutlet.value = value;
    update();
  }

  updateSelectedCurrency(CurrencyType value) {
    selectedCurrency = value;
    update();
  }

  @override
  void onInit() {
    outletListItems = argumentData['outlets'];
    selectedOutlet = outletListItems[0];

    currencyList = argumentData['currencies'];
    selectedCurrency = currencyList[0];

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
