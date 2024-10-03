import 'package:flutter/material.dart';

import 'chip_group.dart';

class SelfDiagnosisOutside extends StatefulWidget {
  const SelfDiagnosisOutside({super.key});

  @override
  State<SelfDiagnosisOutside> createState() => _SelfDiagnosisOutsideState();
}

class _SelfDiagnosisOutsideState extends State<SelfDiagnosisOutside> {
  // 선택된 칩들의 상태를 관리하는 리스트
  List<String> selectedChoices = [];

  // 선택 가능한 옵션들
  final List<String> body = ['없음', '발적', '궤사', '근육출혈', '괴양', '여윤', '두부함몰'];
  final List<String> abdomen = ['없음', '팽만'];
  final List<String> mouth = ['없음', '주둥이괴양'];
  final List<String> eye = ['없음','돌출', '출혈'];
  final List<String> fin = ['없음', '갈라짐', '출혈', '궤사', '결손'];
  final List<String> anus = ['없음', '염증', '탈장'];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Text(
              "체표",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: body),
            SizedBox(height: 8,),
            Text(
              "복부",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: abdomen),
            SizedBox(height: 8,),
            Text(
              "입",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: mouth),
            SizedBox(height: 8,),
            Text(
              "눈",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: eye),
            SizedBox(height: 8,),
            Text(
              "지느러미",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: fin),
            SizedBox(height: 8,),
            Text(
              "항문",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ChipGroup(options: anus),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
