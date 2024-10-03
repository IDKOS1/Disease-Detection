import 'package:build_test/Util/util.dart';
import 'package:build_test/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiagnosticResult extends StatefulWidget {
  const DiagnosticResult({super.key});

  @override
  State<DiagnosticResult> createState() => _DiagnosticResultState();
}

class _DiagnosticResultState extends State<DiagnosticResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UtilAppBar(context, "진단 결과"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
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
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
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
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
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
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정
                      ),
                      child: Center(
                        child: Text(
                          "진단 결과",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[50], // 배경색을 파란색으로 설정
                borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "판독 결과",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 70,
                            child: Text(
                              "질병명: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text("에드워드병 (Edwardsiellosis)",
                              style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Container(
                            width: 70,
                            child: Text(
                              "원인체: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text("세균질병 (Edwardsiella piscicida)",
                              style: TextStyle(fontSize: 16))
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "증상: ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("• 체표 (발적, 근육출혈, 문드러짐)\n"
                          "• 복부(팽만)\n"
                          "• 눈(돌출)\n"
                          "• 지느러미(출혈)\n"
                          "• 항문	(탈장, 염증)\n"
                          "• 아가미(빈혈, 문드러짐)\n"
                          "• 복수(출혈성복수, 탁한복수)\n"
                          "• 간(비대, 염증, 섬유화, 농양)\n"
                          "• 신장(비대, 농양, 결절, 염증)\n"
                          "• 비장(비대)\n"
                          "• 장(염증, 출혈, 장벽 얇아짐)\n")
                    ],
                  )),
            ),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(HomePage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 130,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.green, // 배경색을 파란색으로 설정
                        borderRadius: BorderRadius.circular(8.0), // 모서리를 둥글게 설정
                      ),
                    child: Text("예방 및 치료"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
