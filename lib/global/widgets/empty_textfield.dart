import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';
import 'package:get/get.dart';

class EmptyTextField extends StatelessWidget {
  const EmptyTextField({
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
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          width: Get.width,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
