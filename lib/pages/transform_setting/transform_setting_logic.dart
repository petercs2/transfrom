import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransformSettingLogic extends GetxController {

  Color section1Color = Colors.white;
  Color section2Color = Colors.white;
  int section1R = 0;
  int section1G = 0;
  int section1B = 0;
  int section2R = 0;
  int section2G = 0;
  int section2B = 0;

  restoreDefaultColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('section1', ['114','255','10']);
    await prefs.setStringList('section2', ['196','0','255']);
    section1Color =const Color.fromRGBO(114, 255, 10, 1);
    section2Color =const Color.fromRGBO(196, 0, 255, 1);
    section1R = 114;
    section1G = 255;
    section1B = 10;
    section2R = 196;
    section2G = 0;
    section2B = 255;
    update();
  }

  aboutTransformUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with clocks of different colors"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final section1ColorList = prefs.getStringList('section1');
    final section2ColorList = prefs.getStringList('section2');
    section1Color = Color.fromRGBO(
        int.parse(section1ColorList![0]),
        int.parse(section1ColorList![1]),
        int.parse(section1ColorList![2]), 1);
    section2Color = Color.fromRGBO(
        int.parse(section2ColorList![0]),
        int.parse(section2ColorList![1]),
        int.parse(section2ColorList![2]), 1);
    section1R = int.parse(section1ColorList![0]);
    section1G = int.parse(section1ColorList![1]);
    section1B = int.parse(section1ColorList![2]);
    section2R = int.parse(section2ColorList![0]);
    section2G = int.parse(section2ColorList![1]);
    section2B = int.parse(section2ColorList![2]);
    update();
    super.onInit();
  }

}
