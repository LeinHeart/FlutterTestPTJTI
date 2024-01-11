import 'package:flutter/material.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/global/widgets/loader.dart';
import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return controller.isLoading.value
            ? const Scaffold(body: Center(child: Loader()))
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    "APP KEUANGAN",
                    style: AppTextStyle.roboto(
                      fontSize: 14,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          AppIcons.notifBtn,
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                body: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      // --- Tab Bar
                      SizedBox(
                        height: 150,
                        width: Get.width,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MenuButton(
                              menuText: "HOME",
                              menuIcon: AppIcons.menuHomeBtn,
                            ),
                            MenuButton(
                              isEnabled: false,
                              menuText: "TRANSAKSI",
                              menuIcon: AppIcons.menuTransaksiBtn,
                            ),
                            MenuButton(
                              isEnabled: false,
                              menuText: "LAPORAN",
                              menuIcon: AppIcons.menuLaporanBtn,
                            ),
                            MenuButton(
                              isEnabled: false,
                              menuText: "TOOLS",
                              menuIcon: AppIcons.menuSettingsBtn,
                            ),
                          ],
                        ),
                      ),
                      // --- Body
                      Expanded(
                        child: Container(
                          color: AppColors.primaryBlue,
                          child: ListView.builder(
                            itemCount: controller.outletListItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return OutletSummary(
                                outletName: controller
                                    .outletListItems[index].outletName,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class TabBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.5); // Move to center-left
    path.lineTo(size.height * 0.5, size.width * 0.33);
    // path.lineTo(size.width, size.height); // Line to bottom-right
    // path.lineTo(size.width, 0); // Line to top-right
    // path.lineTo(size.width / 2 + 40, 0); // Line to top-center
    // path.arcToPoint(
    //   Offset(size.width / 2 - 40, 0),
    //   radius: Radius.circular(40),
    //   clockwise: false,
    // ); // Arc to create the circular piece
    // path.lineTo(size.width / 2 - 40, 0); // Line to top-center
    path.close(); // Close the path to form a closed shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
