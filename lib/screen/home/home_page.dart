import 'package:build_test/screen/camera/camera_page.dart';
import 'package:build_test/screen/disease_trends/disease_trends.dart';
import 'package:build_test/screen/environmental_info/environmental_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../disease_info/disease_info.dart';
import '../prevention/prevention.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수산질병 진단/예측'),
        centerTitle: true, // 중앙 정렬
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // 현재 계정 이미지 set
                // backgroundImage: AssetImage('assets/profile.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('GANGPRO'),
              accountEmail: Text('gangpro@email.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ExpansionTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('질병 정보'),
              trailing: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up // 펼쳐졌을 때 아이콘
                    : Icons.keyboard_arrow_down, // 닫혔을 때 아이콘
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded = expanded; // 확장 상태 업데이트
                });
              },
              children: [
                ListTile(
                  title: Text('넙치 질병'),
                  onTap: () {
                    Get.to(() => HalibutDisease());
                  },
                ),
                ListTile(
                  title: Text('환경 정보'),
                  onTap: () {
                    Get.to(() => EnvironmentalInfo());
                  },
                ),
                ListTile(
                  title: Text('질병 발생 동향'),
                  onTap: () {
                    Get.to(() => DiseaseTrends());
                  },
                ),
                ListTile(
                  title: Text('예방 및 치료'),
                  onTap: () {
                    Get.to(() => Prevention());
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('질병 진단/예측'),
              onTap: () {
                Get.to(() => CameraPage());
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
