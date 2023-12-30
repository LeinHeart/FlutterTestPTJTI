
  import 'package:flutter/material.dart';
  import '../controller/mutasi_controller.dart';
  import 'package:flutter_test_pt_jelajah_teknologi_negeri/core.dart';
  import 'package:get/get.dart';
  
  class MutasiView extends StatelessWidget {
    const MutasiView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetBuilder<MutasiController>(
        init: MutasiController(),
        builder: (controller) {
          controller.view = this;
  
          return Scaffold(
            appBar: AppBar(
              title: const Text("Mutasi"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [],
                ),
              ),
            ),
          );
        },
      );
    }
  }
    