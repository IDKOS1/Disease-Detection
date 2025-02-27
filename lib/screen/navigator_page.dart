import 'dart:io';

import 'package:build_test/get_controller/willPop_controller.dart';
import 'package:build_test/screen/disease/disease_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../get_controller/navigator_controller.dart';
import 'camera/camera_page.dart';
import 'result/result.dart';
import 'setting_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final BottomNavigationController _PageCtrl =
      Get.put(BottomNavigationController());
  List? _pages;

  @override
  void initState() {
    super.initState();
    _pages = [CameraPage(), ResultPage(), DiseasePage(), SettingPage()];
  }

  WillPopController popController = WillPopController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => popController.handleWillPopScopeAction(),
        child: Scaffold(
            body: Center(child: _pages![_PageCtrl.currentPage.toInt()]),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _PageCtrl.currentPage.toInt(),
                onTap: _PageCtrl.changeIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.camera_alt), label: '촬영'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.upload), label: '결과 확인'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book), label: '질병 정보'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: '내 정보'),
                ],
                // 선택된 index 색상
                selectedItemColor: Theme.of(context).colorScheme.primary,
                // 미선택된 index 색상
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.shifting
                //BottomNavigationBarType.shifting : selected 된 item 확대
                )),
      ),
    );
  }
}
