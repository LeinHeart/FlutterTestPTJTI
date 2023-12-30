import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/currency_type.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:get/get.dart';
import '../view/kurs_view.dart';

class KursController extends GetxController {
  static KursController get instance => Get.find();

  dynamic argumentData = Get.arguments;
  KursView? view;

  var isSelectingOutlet = false.obs;

  late List<OutletListItem> outletListItems;
  OutletListItem? selectedOutlet;

  updateIsSelectingOutlet(bool value) {
    isSelectingOutlet.value = value;
    update();
  }

  updateSelectedOutlet(OutletListItem value) {
    selectedOutlet = value;
    update();
  }

  late List<CurrencyType> currencyList;
  CurrencyType? selectedCurrencyDari;
  CurrencyType? selectedCurrencyKe;

  updateSelectedCurrencyDari(CurrencyType value) {
    selectedCurrencyDari = value;
    update();
  }

  updateSelectedCurrencyKe(CurrencyType value) {
    selectedCurrencyKe = value;
    update();
  }

  var isShowingJenisLaporan = false.obs;

  updateIsShowingJenisLaporan(bool value) {
    isShowingJenisLaporan.value = value;
    update();
  }

  @override
  void onInit() {
    outletListItems = argumentData['outlets'];
    selectedOutlet = outletListItems[0];

    currencyList = argumentData['currencies'];
    selectedCurrencyDari = currencyList[0];
    selectedCurrencyKe = currencyList[0];
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
