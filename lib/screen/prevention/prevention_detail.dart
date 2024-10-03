import 'package:build_test/class/class.dart';
import 'package:flutter/material.dart';

import 'vaccine_list.dart';

class PreventionDetail extends StatelessWidget {
  final DiseaseTreatment diseaseTreatment;

  const PreventionDetail({
    super.key,
    required this.diseaseTreatment,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE5F2FF), // 배경색
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: const Text(
                      "예방법",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  Text(
                    diseaseTreatment.preventive,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE5F2FF), // 배경색
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.centerLeft, // 왼쪽 정렬
                    child: const Text(
                      "치료법",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  Text(
                    diseaseTreatment.treatment,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE5F2FF), // 배경색
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                children: [
                  const Text(
                    "백신",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 8.0, // 태그 간 간격
                    runSpacing: 12.0, // 줄바꿈 시 간격
                    children: diseaseTreatment.vaccine.map((vaccine) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  vaccine + "정보",
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "업체명",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(findVaccine(vaccine).company),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text("대상병원체",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Text(findVaccine(vaccine).targetPathogen),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text("확인"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent, // 태그 배경색
                            borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
                            border:
                                Border.all(color: Colors.blueAccent), // 테두리 색상
                          ),
                          child: Text(
                            vaccine,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
