import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_icons.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.menuText,
    required this.menuIcon,
    this.isEnabled = true,
    this.iconSize = 48,
    this.onTap,
  });

  final String menuText, menuIcon;
  final bool isEnabled;
  final double iconSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Opacity(
            opacity: isEnabled ? 1 : 0.15,
            child: Image.asset(
              menuIcon,
              width: iconSize,
              height: iconSize,
            ),
          ),
          Text(
            menuText,
            style: AppTextStyle.roboto(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryBlue.withOpacity(isEnabled ? 1 : 0.15),
            ),
          ),
        ],
      ),
    );
  }
}
