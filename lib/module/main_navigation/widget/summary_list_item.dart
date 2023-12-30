import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_icons.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/main_navigation/widget/currency_text.dart';

class SummaryListItem extends StatelessWidget {
  final String outletName;
  const SummaryListItem({
    super.key,
    required this.outletName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            outletName,
            style: AppTextStyle.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const CurrencyText(
            currencyIcon: AppIcons.currIdr,
            currencyText: 'IDR',
            nominal: '500.000',
          ),
          const CurrencyText(
            currencyIcon: AppIcons.currUsd,
            currencyText: 'USD',
            nominal: '0',
          ),
          const CurrencyText(
            currencyIcon: AppIcons.currEur,
            currencyText: 'EUR',
            nominal: '20.000',
          ),
          const CurrencyText(
            currencyIcon: AppIcons.currSgd,
            currencyText: 'SGD',
            nominal: '6.000',
          ),
        ],
      ),
    );
  }
}
