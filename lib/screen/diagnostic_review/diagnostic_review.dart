import 'dart:io';

import 'package:build_test/Util/util.dart';
import 'package:build_test/class/class.dart';
import 'package:build_test/screen/diagnosis_result/diagnositic_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnosticReview extends StatefulWidget {
  const DiagnosticReview({super.key});

  @override
  State<DiagnosticReview> createState() => _DiagnosticReviewState();
}

class _DiagnosticReviewState extends State<DiagnosticReview> {

  Widget _upGrid(Images images) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.width / 3.2,
          width: size.width / 3.2,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        height: size.height / 1.7,
                        child: Center(
                          child: images.imgPath == null
                              ? const Text('사진이 없어요')
                              : InteractiveViewer(
                              child:
                              Image.file(File(images.imgPath!.path))),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                        child: images.imgPath == null
                            ? const Text(
                          '사진이 없어요',
                          style: TextStyle(fontSize: 10),
                        )
                            : Image.file(File(images.imgPath!.path))),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(images.name)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilAppBar(context, "작성 검토 및 진단/예측"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        ),
                        child: Center(
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
                  SizedBox(width: 8),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        ),
                        child: Center(
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
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        ),
                        child: Center(
                          child: Text(
                            "작성 검토 및\n진단/예측",
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
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.circular(8.0), // 모서리 둥글게 설정
                        ),
                        child: Center(
                          child: Text(
                            "진단 결과",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "이미지 입력 정보",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 16,),
                  for (int i = 0; i <= 14; i += 2) ...[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _upGrid(Images("사진이름", null)),
                        _upGrid(Images("사진이름", null)),
                      ],
                    ),
                  ],
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     _upGrid(Images("사진이름", null)),
                  //   ],
                  // ),
                  SizedBox(width: 16,),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "자가진단 입력 정보",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE5F2FF), // 배경색
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "날짜",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "2024년 9월 30일 10:27",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "양식장 지역",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "지역 2",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "넙치 길이",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "34.4cm",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "넙치 무게",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "580g",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "수온",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "25.4 °C",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          alignment: Alignment.centerLeft, // 왼쪽 정렬
                          child: Text(
                            "외부 증상",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(
                          "출혈",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity, // 가로 길이를 부모 위젯의 가득 채움
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // 배경색을 파란색으로 설정
                  borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
                ),
                child: TextButton(
                  onPressed: () {
                    Get.to(() => DiagnosticResult());
                  },
                  child: Text(
                    '다음',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
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
