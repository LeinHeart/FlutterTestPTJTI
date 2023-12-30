import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.roboto(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.secondaryBlue,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "19/10/2012",
              style: AppTextStyle.roboto(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
