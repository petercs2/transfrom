
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transform_clock/pages/no_network/no_network_binding.dart';
import 'package:transform_clock/pages/no_network/no_network_view.dart';
import 'package:transform_clock/pages/transform_main/transform_main_binding.dart';
import 'package:transform_clock/pages/transform_main/transform_main_view.dart';
import 'package:transform_clock/pages/transform_setting/transform_setting_binding.dart';
import 'package:transform_clock/pages/transform_setting/transform_setting_view.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.white;

const textFamily = 'Time';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final  section1 = prefs.getStringList('section1');
  if (section1 == null) {
    await prefs.setStringList('section1', ['114','255','10']);
    await prefs.setStringList('section2', ['196','0','255']);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Transfrom,
      initialRoute: '/transformMain',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Transfrom = [
  GetPage(name: '/transformMain', page: () => const TransformMainPage(), binding: TransformMainBinding()),
  GetPage(name: '/transformSetting', page: () => TransformSettingPage(), binding: TransformSettingBinding()),
  GetPage(name: '/transformCoko', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
];