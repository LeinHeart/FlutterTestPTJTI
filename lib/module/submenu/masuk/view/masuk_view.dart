import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/outlet_model.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/empty_textfield.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/submenu/masuk/widget/currency_row.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/select_photo_row.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/start_date_textfield.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/submit_button.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:get/get.dart';

class MasukView extends StatelessWidget {
  const MasukView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MasukController>(
      init: MasukController(),
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
                      "Masuk",
                      style: AppTextStyle.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.1,
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
                          // -- Start Date
                          const StartDateTextField(),

                          // -- Input Currency
                          CurrencyInputMasukRow(),

                          // -- Photo
                          const SelectPhotoRow(),

                          // -- Keterangan
                          const EmptyTextField(
                            title: "Keterangan",
                          ),

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
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.black,
                  ),
                ),
              ),

              // -- STACK 3: Dropdown Button
              Container(
                width: Get.width,
                height: Get.height * 0.35,
                alignment: Alignment.center,
                // Dropdown Outlet
                child: Container(
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
              ),
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
