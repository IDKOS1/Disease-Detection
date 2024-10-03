import 'package:build_test/class/class.dart';
import 'package:flutter/material.dart';

import 'prevention_detail.dart';

class Prevention extends StatefulWidget {
  const Prevention({super.key});

  @override
  State<Prevention> createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  DiseaseTreatment edwardDisease = const DiseaseTreatment(
      "에드워드 예방법 에드워드 예방법 에드워드 예방법 에드워드 예방법 에드워드 예방법 에드워드 예방법 ",
      "에드워드 치료법 에드워드 치료법 에드워드 치료법 에드워드 치료법 에드워드 치료법 에드워드 치료법 ",
      ["씨티씨백 세균다자바 플러스", "씨티씨백 세균다자바", "윌로마린 S.E. 4"]);
  DiseaseTreatment vibriodDisease = const DiseaseTreatment(
      "비브리오 예방법 비브리오 예방법 비브리오 예방법 비브리오 예방법 비브리오 예방법 비브리오 예방법 ",
      "비브리오 치료법 비브리오 치료법 비브리오 치료법 비브리오 치료법 비브리오 치료법 비브리오 치료법 ",
      ["씨티씨백 세균다자바 플러스"]);
  DiseaseTreatment streptcoccosisDisease = const DiseaseTreatment(
      "연쇄구균 예방법 연쇄구균 예방법 연쇄구균 예방법 연쇄구균 예방법 연쇄구균 예방법 연쇄구균 예방법 ",
      "연쇄구균 치료법 연쇄구균 치료법 연쇄구균 치료법 연쇄구균 치료법 연쇄구균 치료법 연쇄구균 치료법 ",
      ["씨티씨백 세균다자바 플러스", "씨티씨백 세균다자바", "프로백 TM 에스파라"]);
  DiseaseTreatment tenaclDisease = const DiseaseTreatment(
      "활주세균 예방법 활주세균 예방법 활주세균 예방법 활주세균 예방법 활주세균 예방법 활주세균 예방법 ",
      "활주세균 치료법 활주세균 치료법 활주세균 치료법 활주세균 치료법 활주세균 치료법 활주세균 치료법 ",
      ["씨티씨백 다자바 플러스", "씨티씨백 다자바 주"]);
  DiseaseTreatment scuticocilatosis = const DiseaseTreatment(
      "스쿠티카 예방법 스쿠티카 예방법 스쿠티카 예방법 스쿠티카 예방법 스쿠티카 예방법 스쿠티카 예방법 ",
      "스쿠티카 치료법 스쿠티카 치료법 스쿠티카 치료법 스쿠티카 치료법 스쿠티카 치료법 스쿠티카 치료법 ",
      ["씨티씨백 다자바 플러스", "씨티씨백 다자바 주"]);
  DiseaseTreatment enactiaction = const DiseaseTreatment(
      "여윔증 예방법 여윔증 예방법 여윔증 예방법 여윔증 예방법 여윔증 예방법 여윔증 예방법 ",
      "여윔증 치료법 여윔증 치료법 여윔증 치료법 여윔증 치료법 여윔증 치료법 여윔증 치료법 ",
      []);
  DiseaseTreatment vhsv = const DiseaseTreatment(
      "바이러스출혈성패혈증 예방법 바이러스출혈성패혈증 예방법 바이러스출혈성패혈증 예방법 바이러스출혈성패혈증 예방법 바이러스출혈성패혈증 예방법 바이러스출혈성패혈증 예방법 ",
      "바이러스출혈성패혈증 치료법 바이러스출혈성패혈증 치료법 바이러스출혈성패혈증 치료법 바이러스출혈성패혈증 치료법 바이러스출혈성패혈증 치료법 바이러스출혈성패혈증 치료법 ",
      ["씨티씨백 세균다자바 플러스", "씨티씨백 다자바 플러스", "대성 VHS 피쉬백 주"]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // 탭의 개수
      child: Scaffold(
        appBar: AppBar(
          title: const Text("예방 및 치료",
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
              Tab(text: "비브리오"),
              Tab(text: "연쇄구균병"),
              Tab(text: "활주세균병"),
              Tab(text: "스쿠티카병"),
              Tab(text: "여윔증"),
              Tab(text: "바이러스출혈성패혈증"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PreventionDetail(diseaseTreatment: edwardDisease),
            PreventionDetail(diseaseTreatment: vibriodDisease),
            PreventionDetail(diseaseTreatment: streptcoccosisDisease,),
            PreventionDetail(diseaseTreatment: tenaclDisease,),
            PreventionDetail(diseaseTreatment: scuticocilatosis,),
            PreventionDetail(diseaseTreatment: enactiaction,),
            PreventionDetail(diseaseTreatment: vhsv,),
          ],
        ),
      ),
    );
  }
}
