import 'package:flutter/material.dart';

import 'disease_detail.dart';


class HalibutDisease extends StatefulWidget {
  const HalibutDisease({super.key});

  @override
  State<HalibutDisease> createState() => _HalibutDiseaseState();
}

class _HalibutDiseaseState extends State<HalibutDisease> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // 탭의 개수
      child: Scaffold(
        appBar: AppBar(
          title: const Text("넙치 질병",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            tabs: [
              Tab(text: "에드워드병"),
              Tab(text: "연쇄구균병"),
              Tab(text: "활주세균병"),
              Tab(text: "스쿠티카병"),
              Tab(text: "여윔증"),
              Tab(text: "바이러스출혈성패혈증"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DiseaseDetail(name: '에드워드병',),
            DiseaseDetail(name: '연쇄구균병',),
            DiseaseDetail(name: '활주세균병',),
            DiseaseDetail(name: '스쿠티카병',),
            DiseaseDetail(name: '여윔증',),
            DiseaseDetail(name: '바이러스출혈성패혈증',),
          ],
        ),
      ),
    );
  }
}

