import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/submit_button.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/submenu/kurs/widget/currency_row_dari.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/submenu/kurs/widget/currrency_row_ke.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/submenu/kurs/widget/date_text.dart';
import '../controller/kurs_controller.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:get/get.dart';

class KursView extends StatelessWidget {
  const KursView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KursController>(
      init: KursController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Stack(
            children: [
              // -- STACK 1: AppBar, Header and Form
              Column(
                children: [
                  AppBar(
                    title: Text(
                      "Pindah Kurs",
                      style: AppTextStyle.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.15,
                    // color: Colors.black,
                    alignment: Alignment.center,
                  ),
                  // - FORM
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: AppColors.primaryBlue,
                      child: Column(
                        children: [
                          // -- Input Currency Dari
                          CurrencyInputKursDariRow(),

                          // -- Input Currency Dari
                          CurrencyInputKursKeRow(),

                          const Spacer(),

                          // -- Submit Button
                          const SubmitButton(),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // -- STACK 2: Overlay
              Visibility(
                maintainAnimation: true,
                maintainState: true,
                visible: controller.isSelectingOutlet.value,
                child: AnimatedOpacity(
                  opacity: controller.isSelectingOutlet.value ? 0.3 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () {
                      controller.updateIsSelectingOutlet(false);
                      controller.updateIsShowingJenisLaporan(false);
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              // -- STACK 3: Dropdown Button
              Container(
                width: Get.width,
                height: Get.height * 0.3,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80.0,
                    ),
                    // Dropdown Outlet
                    Container(
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<OutletListItem>(
                          value: controller.selectedOutlet,
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconEnabledColor: AppColors.primaryBlue,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            offset: const Offset(0, -10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onChanged: (value) =>
                              controller.updateSelectedOutlet(value!),
                          onMenuStateChange: (isOpen) {
                            controller.updateIsSelectingOutlet(isOpen);
                          },
                          items: controller.outletListItems
                              .map(buildMenuItem)
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.isSelectingOutlet.value) {
                          controller.updateIsSelectingOutlet(false);
                          controller.updateIsShowingJenisLaporan(false);
                        } else {
                          controller.updateIsSelectingOutlet(true);
                          controller.updateIsShowingJenisLaporan(true);
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Jenis Laporan",
                              style: AppTextStyle.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            Text(
                              "19/10/2012 - 19/10/2012",
                              style: AppTextStyle.roboto(
                                fontSize: 10,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primaryBlue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.isShowingJenisLaporan.value,
                child: Positioned.fill(
                  top: 240,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Get.width * 0.95,
                      height: Get.height * 0.3,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Filter",
                            style: AppTextStyle.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBlue),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          // -- Jenis Laporan Dropdown
                          Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Jenis Laporan",
                                      style: AppTextStyle.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primaryBlue,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // -- Start Date & To Date
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            width: double.infinity,
                            height: 70,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DateText(title: "Start Date"),
                                DateText(title: "To Date"),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const SubmitButton(
                            backgroundColor: AppColors.primaryBlue,
                            foregroundColor: Colors.white,
                            textColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  DropdownMenuItem<OutletListItem> buildMenuItem(OutletListItem item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item.outletName,
          style: AppTextStyle.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.primaryBlue,
          ),
        ),
      );
}
