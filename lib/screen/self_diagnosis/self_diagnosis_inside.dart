import 'package:build_test/screen/diagnostic_review/diagnostic_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chip_group.dart';

class SelfDiagnosisInside extends StatefulWidget {
  const SelfDiagnosisInside({super.key});

  @override
  State<SelfDiagnosisInside> createState() => _SelfDiagnosisInsideState();
}

class _SelfDiagnosisInsideState extends State<SelfDiagnosisInside> {
  // 선택된 칩들의 상태를 관리하는 리스트
  List<String> selectedChoices = [];

  // 선택 가능한 옵션들
  final List<String> gill = ['없음', '발적', '궤사', '근육출혈', '괴양', '여윤', '두부함몰'];
  final List<String> ascites = ['없음', '탁한복수', '맑은복수'];
  final List<String> liver = ['없음', '팽만'];
  final List<String> kidney = ['없음', '주둥이괴양'];
  final List<String> spleen = ['없음', '돌출', '출혈'];
  final List<String> internal = ['없음', '갈라짐', '출혈', '궤사', '결손'];
  final List<String> reproductive = ['없음', '출혈', '국소적흑화'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              "아가미",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: gill),
            SizedBox(
              height: 8,
            ),
            Text(
              "복수",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: ascites),
            SizedBox(
              height: 8,
            ),
            Text(
              "간",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: liver),
            SizedBox(
              height: 8,
            ),
            Text(
              "신장",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: kidney),
            SizedBox(
              height: 8,
            ),
            Text(
              "비장",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: spleen),
            SizedBox(
              height: 8,
            ),
            Text(
              "장",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: internal),
            SizedBox(
              height: 8,
            ),
            Text(
              "생식소",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: reproductive),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity, // 가로 길이를 부모 위젯의 가득 채움
              decoration: BoxDecoration(
                color: Colors.blueAccent, // 배경색을 파란색으로 설정
                borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(() => DiagnosticReview());
                },
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
