import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:transform_clock/main.dart';
import 'dart:math' as math;
import 'transform_main_logic.dart';

class TransformMainPage extends StatefulWidget {
  const TransformMainPage({Key? key}) : super(key: key);

  @override
  State<TransformMainPage> createState() => _TransformMainPageState();
}

class _TransformMainPageState extends State<TransformMainPage> {
  TransformMainLogic controller = Get.find();

  void nvjkabihi2() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/transformCoko');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    nvjkabihi2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TransformMainLogic>(builder: (_) {
        return SafeArea(
            child: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: const Icon(
              Icons.settings,
              size: 40,
              color: Colors.black,
            ).gestures(onTap: () {
              Get.toNamed('/transformSetting')?.then((_) {
                controller.colorRefresh();
              });
            }),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: RotatedBox(
              quarterTurns: -controller.section2Angle,
              child: SizedBox.expand(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    Transform(
                      transform: Matrix4.identity()..rotateZ(math.pi),
                      alignment: Alignment.center,
                      child: <Widget>[
                        Obx(() {
                          return Text(
                            controller.weekStr.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: textFamily,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                        Obx(() {
                          return Text(
                            controller.ymdStr.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: textFamily,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(math.pi),
                      child: Obx(() {
                        return Text(
                          controller.hmsStr.value,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                              fontFamily: textFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateZ(math.pi),
                      child: <Widget>[
                        const Text(
                          'Section 02',
                          style: TextStyle(
                              fontFamily: textFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Container(
                          width: 44,
                          height: 44,
                          child: <Widget>[
                            Image.asset(
                              'assets/img.webp',
                              width: 20.12,
                              height: 17.25,
                              fit: BoxFit.cover,
                            )
                          ].toRow(mainAxisAlignment: MainAxisAlignment.center),
                        )
                            .decorated(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22))
                            .gestures(onTap: () {
                          switch (controller.section2Angle) {
                            case 0:
                              controller.section2Angle = 1;
                              break;
                            case 1:
                              controller.section2Angle = 2;
                              break;
                            case 2:
                              controller.section2Angle = 3;
                              break;
                            case 3:
                              controller.section2Angle = 0;
                              break;
                          }
                          controller.update();
                        })
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    ),
                  ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                ).decorated(color: controller.section2Color, boxShadow: [
                  BoxShadow(
                      color: controller.section2Color,
                      blurRadius: 5,
                      spreadRadius: 5)
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: RotatedBox(
            quarterTurns: -controller.section1Angle,
            child: SizedBox.expand(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  <Widget>[
                    const Text(
                      'Section 01',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: textFamily),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      child: <Widget>[
                        Image.asset(
                          'assets/img.webp',
                          width: 20.12,
                          height: 17.25,
                          fit: BoxFit.cover,
                        )
                      ].toRow(mainAxisAlignment: MainAxisAlignment.center),
                    )
                        .decorated(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22))
                        .gestures(onTap: () {
                      switch (controller.section1Angle) {
                        case 0:
                          controller.section1Angle = 1;
                          break;
                        case 1:
                          controller.section1Angle = 2;
                          break;
                        case 2:
                          controller.section1Angle = 3;
                          break;
                        case 3:
                          controller.section1Angle = 0;
                          break;
                      }
                      controller.update();
                    })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  Obx(() {
                    return Text(
                      controller.hmsStr.value,
                      style: const TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          fontFamily: textFamily),
                    );
                  }),
                  <Widget>[
                    Obx(() {
                      return Text(
                        controller.weekStr.value,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: textFamily),
                      );
                    }),
                    Obx(() {
                      return Text(
                        controller.ymdStr.value,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: textFamily),
                      );
                    }),
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
              ).decorated(color: controller.section1Color, boxShadow: [
                BoxShadow(
                    color: controller.section1Color,
                    blurRadius: 10,
                    spreadRadius: 5)
              ]),
            ),
          ))
        ].toColumn().marginSymmetric(horizontal: 15));
      }),
    );
  }
}
