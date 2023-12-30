import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';
import 'package:get/get.dart';

class SelectPhotoRow extends StatelessWidget {
  const SelectPhotoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Photo",
          style: AppTextStyle.roboto(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 85,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          // -- Row of Photo Preview
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // -- Tambahkan Foto
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.secondaryBlue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primaryBlue.withOpacity(0.5),
                      size: 16,
                    ),
                    Text(
                      "Tambahkan\nFoto",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.roboto(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.secondaryBlue.withOpacity(0.25),
                ),
              ),
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.secondaryBlue.withOpacity(0.25),
                ),
              ),
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.secondaryBlue.withOpacity(0.25),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
