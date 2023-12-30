import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    this.backgroundColor = AppColors.secondaryBlue,
    this.foregroundColor = AppColors.primaryBlue,
    this.textColor = AppColors.primaryBlue,
  });

  final Color backgroundColor, foregroundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 30,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: Text(
          "Submit",
          style: AppTextStyle.roboto(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
