import 'package:flutter/material.dart';

import 'environmental_detail.dart';

class EnvironmentalInfo extends StatefulWidget {
  const EnvironmentalInfo({super.key});

  @override
  State<EnvironmentalInfo> createState() => _EnvironmentalInfoState();
}

class _EnvironmentalInfoState extends State<EnvironmentalInfo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 탭의 개수
      child: Scaffold(
        appBar: AppBar(
          title: const Text("환경정보",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(text: "제주"),
              Tab(text: "완도"),
              Tab(text: "해남"),
              Tab(text: "전체"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EnvironmentalDetail(images: "jeju.png"),
            EnvironmentalDetail(images: "wando.png"),
            EnvironmentalDetail(images: "jeju.png"),
            EnvironmentalDetail(images: "wando.png"),
          ],
        ),
      ),
    );
  }
}
