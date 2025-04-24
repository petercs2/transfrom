import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:transform_clock/pages/transform_main/transform_slider.dart';

import 'transform_setting_logic.dart';

class TransformSettingPage extends GetView<TransformSettingLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Restore the default', 'Ver'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 1 ? const Text("v1.0.0").paddingOnly(right: 10) :  const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.restoreDefaultColor();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<TransformSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  <Widget>[
                    Container(
                      width: 24,
                      height: 24,
                    ).decorated(
                        color: controller.section1Color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffd9d9d9))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Section 01 color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ].toRow(),
                  const SizedBox(
                    height: 10,
                  ),
                  TransformSlider(0, controller.section1R, (v) async {
                    controller.section1R = v;
                    controller.section1Color = Color.fromRGBO(
                        controller.section1R,
                        controller.section1G,
                        controller.section1B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section1', [
                      controller.section1R.toString(),
                      controller.section1G.toString(),
                      controller.section1B.toString()
                    ]);
                  }),
                  TransformSlider(1, controller.section1G, (v) async {
                    controller.section1G = v;
                    controller.section1Color = Color.fromRGBO(
                        controller.section1R,
                        controller.section1G,
                        controller.section1B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section1', [
                      controller.section1R.toString(),
                      controller.section1G.toString(),
                      controller.section1B.toString()
                    ]);
                  }),
                  TransformSlider(2, controller.section1B, (v) async {
                    controller.section1B = v;
                    controller.section1Color = Color.fromRGBO(
                        controller.section1R,
                        controller.section1G,
                        controller.section1B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section1', [
                      controller.section1R.toString(),
                      controller.section1G.toString(),
                      controller.section1B.toString()
                    ]);
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    Container(
                      width: 24,
                      height: 24,
                    ).decorated(
                        color: controller.section2Color,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffd9d9d9))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Section 02 color',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ].toRow(),
                  const SizedBox(
                    height: 10,
                  ),
                  TransformSlider(0, controller.section2R, (v) async {
                    controller.section2R = v;
                    controller.section2Color = Color.fromRGBO(
                        controller.section2R,
                        controller.section2G,
                        controller.section2B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section2', [
                      controller.section2R.toString(),
                      controller.section2G.toString(),
                      controller.section2B.toString()
                    ]);
                  }),
                  TransformSlider(1, controller.section2G, (v) async {
                    controller.section2G = v;
                    controller.section2Color = Color.fromRGBO(
                        controller.section2R,
                        controller.section2G,
                        controller.section2B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section2', [
                      controller.section2R.toString(),
                      controller.section2G.toString(),
                      controller.section2B.toString()
                    ]);
                  }),
                  TransformSlider(2, controller.section2B, (v) async {
                    controller.section2B = v;
                    controller.section2Color = Color.fromRGBO(
                        controller.section2R,
                        controller.section2G,
                        controller.section2B,
                        1);
                    controller.update();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList('section2', [
                      controller.section2R.toString(),
                      controller.section2G.toString(),
                      controller.section2B.toString()
                    ]);
                  }),
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                    separator: Divider(
                  height: 15,
                  color: Colors.grey.shade300,
                )),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
