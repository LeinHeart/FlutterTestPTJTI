import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';

class CurrencyText extends StatelessWidget {
  const CurrencyText({
    super.key,
    required this.currencyIcon,
    required this.currencyText,
    required this.nominal,
  });

  final String currencyIcon, currencyText, nominal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 36, top: 5),
      child: Row(
        children: [
          Image.asset(
            currencyIcon,
            width: 20,
          ),
          const SizedBox(width: 8.0),
          Text(
            currencyText,
            style: AppTextStyle.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 8.0),
          const Expanded(
            child: DottedLine(
              dashColor: AppColors.secondaryBlue,
              dashGapLength: 5,
              dashLength: 5,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            nominal,
            style: AppTextStyle.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          )
        ],
      ),
    );
  }
}
