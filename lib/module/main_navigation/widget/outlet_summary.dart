import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_colors.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/constants/app_icons.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/text_styles/text_style.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/main_navigation/widget/menu_button.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/module/main_navigation/widget/summary_list_item.dart';
import 'package:get/get.dart';

class OutletSummary extends StatefulWidget {
  final String outletName;
  const OutletSummary({
    super.key,
    required this.outletName,
  });

  @override
  State<OutletSummary> createState() => _OutletSummaryState();
}

class _OutletSummaryState extends State<OutletSummary> {
  bool isSelected = false;
  final controller = MainNavigationController.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // -- Main Summary Data
          SummaryListItem(
            outletName: widget.outletName,
          ),

          // -- Overlay
          AnimatedOpacity(
            opacity: isSelected ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 160,
            ),
          ),

          // -- Slider
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: isSelected ? 0 : -260,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondaryBlue,
                  borderRadius: BorderRadius.circular(20)),
              width: 300,
              height: 160,
              child: Row(
                children: [
                  // Slider Button
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(isSelected
                          ? AppIcons.closeSlideBtn
                          : AppIcons.openSlideBtn),
                    ),
                  ),

                  // -- Sub Menu & Summary
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // -- Sub Menu
                        Row(
                          children: [
                            MenuButton(
                              onTap: () => Get.to(const MasukView(),
                                  arguments: controller.response),
                              menuIcon: AppIcons.submenuMasukBtn,
                              menuText: "MASUK",
                              iconSize: 24,
                            ),
                            const SizedBox(width: 12.0),
                            MenuButton(
                              onTap: () => Get.to(const KeluarView(),
                                  arguments: controller.response),
                              menuIcon: AppIcons.submenuKeluarBtn,
                              menuText: "KELUAR",
                              iconSize: 24,
                            ),
                            const SizedBox(width: 12.0),
                            MenuButton(
                              onTap: () => Get.to(const PindahView(),
                                  arguments: controller.response),
                              menuIcon: AppIcons.submenuPindahBtn,
                              menuText: "PINDAH",
                              iconSize: 24,
                            ),
                            const SizedBox(width: 12.0),
                            MenuButton(
                              onTap: () => Get.to(const MutasiView()),
                              menuIcon: AppIcons.submenuMutasiBtn,
                              menuText: "MUTASI",
                              iconSize: 24,
                            ),
                            const SizedBox(width: 12.0),
                            MenuButton(
                              onTap: () => Get.to(const KursView(),
                                  arguments: controller.response),
                              menuIcon: AppIcons.submenuKursBtn,
                              menuText: "KURS",
                              iconSize: 24,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        // -- Summary
                        Container(
                          height: 80,
                          width: 235,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const OutletSummaryText(
                                  titleText: "Jumlah Barang",
                                  valueText: "16",
                                  textColor: AppColors.grey,
                                ),
                                const OutletSummaryText(
                                  titleText: "Total IDR",
                                  valueText: "Rp. 100.000.000",
                                ),
                                const OutletSummaryText(
                                  titleText: "Total USD",
                                  valueText: "\$ 2.000",
                                ),
                                const OutletSummaryText(
                                  titleText: "Total EUR",
                                  valueText: "€ 200",
                                ),
                                const OutletSummaryText(
                                  titleText: "Total SGD",
                                  valueText: "S\$ 1.000",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OutletSummaryText extends StatelessWidget {
  const OutletSummaryText({
    super.key,
    required this.titleText,
    required this.valueText,
    this.textColor = AppColors.primaryBlue,
  });

  final String titleText, valueText;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style: AppTextStyle.roboto(fontSize: 8, color: textColor),
        ),
        const Expanded(
          child: DottedLine(
            dashColor: AppColors.secondaryBlue,
            dashGapLength: 5,
            dashLength: 5,
          ),
        ),
        Text(
          valueText,
          style: AppTextStyle.roboto(fontSize: 8, color: textColor),
        ),
      ],
    );
  }
}
