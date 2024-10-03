import 'package:build_test/Util/util.dart';
import 'package:flutter/material.dart';

import 'self_diagnosis_date.dart';
import 'self_diagnosis_inside.dart';
import 'self_diagnosis_outside.dart';

class SelfDiagnosis extends StatefulWidget {
  const SelfDiagnosis({super.key});

  @override
  State<SelfDiagnosis> createState() => _SelfDiagnosisState();
}

class _SelfDiagnosisState extends State<SelfDiagnosis> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // TabBar의 탭 수에 맞게 수정
      child: Scaffold(
        appBar: UtilAppBar(context, "수산 질병 진단/ 예측"),
        backgroundColor: const Color(0xfff4f3f9),
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Text(
                                "이미지 촬영",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Text(
                                "자가진단\n작성",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Text(
                                "작성 검토 및\n진단/예측",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Text(
                                "진단 결과",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(text: "날짜"),
                      Tab(text: "증상(외부)"),
                      Tab(text: "증상(내부)"),
                    ],
                  ),
                  // Flexible로 변경
                  Flexible(
                    child: TabBarView(
                      children: [
                        SelfDiagnosisDate(),
                        SelfDiagnosisOutside(),
                        SelfDiagnosisInside(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
