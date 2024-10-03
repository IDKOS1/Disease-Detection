import 'package:build_test/get_controller/url_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screen/login/sign_in.dart';
import 'screen/navigator_page.dart';

void main() async {
  await GetStorage.init();

  final controller = Get.put(UrlController());

  Future<bool> checkToken = controller.checkToken();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true
      ),
      home: await checkToken ? const NavigatorPage() : LoginPage(),

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}
