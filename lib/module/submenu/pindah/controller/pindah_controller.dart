import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/currency_type.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:get/get.dart';
import '../view/pindah_view.dart';

class PindahController extends GetxController {
  static PindahController get instance => Get.find();
  PindahView? view;

  dynamic argumentData = Get.arguments;

  var isSelectingOutlet = false.obs;

  late List<OutletListItem> outletListItems;
  OutletListItem? selectedOutletDari;
  OutletListItem? selectedOutletKe;

  late List<CurrencyType> currencyList;
  CurrencyType? selectedCurrency;

  updateSelectedOutletDari(OutletListItem value) {
    selectedOutletDari = value;
    update();
  }

  updateSelectedOutletKe(OutletListItem value) {
    selectedOutletKe = value;
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
    selectedOutletDari = outletListItems[0];
    selectedOutletKe = outletListItems[0];

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
