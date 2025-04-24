import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransformMainLogic extends GetxController {
  Timer? _timer;

  var section1Color = Colors.transparent;
  var section2Color = Colors.transparent;
  int section1Angle = 0;
  int section2Angle = 2;

  var hmsStr = '00:00'.obs;
  var ymdStr = ''.obs;
  var weekStr = ''.obs;

  void startTimer() {
    getData();
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getData();
    });
  }

  void getData() {
    final now = DateTime.now();
    hmsStr.value = DateFormat('HH:mm:ss').format(now);
    ymdStr.value = DateFormat('MM/dd/yyyy').format(now);
    weekStr.value = DateFormat('EEE').format(now);
  }

  colorRefresh() async {
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
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await colorRefresh();
    startTimer();
    super.onInit();
  }
}
