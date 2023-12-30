import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/models/currency_type.dart';
import 'package:get/get.dart';

class CurrencyInputMasukRow extends StatelessWidget {
  const CurrencyInputMasukRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MasukController.instance;

    return Column(
      children: [
        Text(
          "Input",
          style: AppTextStyle.roboto(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          alignment: Alignment.center,
          width: Get.width,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "0",
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 15.0),
              const DottedLine(
                direction: Axis.vertical,
              ),
              const SizedBox(width: 5.0),
              DropdownButtonHideUnderline(
                child: DropdownButton2<CurrencyType>(
                  value: controller.selectedCurrency,
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
                      controller.updateSelectedCurrency(value!),
                  items: controller.currencyList
                      .map(buildCurrencyTypeMenuItem)
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }

  DropdownMenuItem<CurrencyType> buildCurrencyTypeMenuItem(CurrencyType item) {
    String getCurrencyIcon(String curr) {
      switch (curr) {
        case "IDR":
          return AppIcons.currIdr;
        case "EUR":
          return AppIcons.currEur;
        case "SGD":
          return AppIcons.currSgd;
        case "USD":
          return AppIcons.currUsd;

        default:
          return AppIcons.currIdr;
      }
    }

    return DropdownMenuItem(
      value: item,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              getCurrencyIcon(item.ctNama),
            ),
            const SizedBox(width: 5.0),
            Text(
              item.ctNama,
              style: AppTextStyle.roboto(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
