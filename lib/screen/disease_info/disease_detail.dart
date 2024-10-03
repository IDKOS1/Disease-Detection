import 'package:flutter/material.dart';

class DiseaseDetail extends StatelessWidget {
  final String name;

  const DiseaseDetail({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
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
                              "원인체",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Text(
                            "원인체 내용",
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
                              "질병명",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Text(
                            "질병명 이름",
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
                              "병원체",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Text(
                            "병원체 내용",
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
                              "진단 방법",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Text(
                            "진단방법 내용",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text("질병 증상 이미지",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // 가로 스크롤 가능
            child: Row(
              children: [
                SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 설정
                  child: Image.asset(
                    'images/disease/edward/image_00.png',

                    height: 100, // 세로 크기 고정
                    fit: BoxFit.contain, // 이미지 비율에 맞게 조절
                  ),
                ),
                SizedBox(width: 10), // 이미지 간 간격
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 설정
                  child: Image.asset(
                    'images/disease/edward/image_01.png', // 두 번째 이미지 URL
                    height: 100, // 세로 크기 고정
                    fit: BoxFit.contain, // 이미지 비율에 맞게 조절
                  ),
                ),
                SizedBox(width: 10), // 이미지 간 간격
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 설정
                  child: Image.asset(
                    'images/disease/edward/image_02.png', // 세 번째 이미지 URL
                    height: 100, // 세로 크기 고정
                    fit: BoxFit.contain, // 이미지 비율에 맞게 조절
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("질병 설명",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "에드워드병은 초기 치료가 매우 중요하며, 적절한 약물과 환경 개선이 필요합니다. "
                  "항생제를 사용하거나 물고기가 스트레스를 받지 않도록 환경을 조성하는 것이 좋습니다.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "에드워드병의 예방을 위해서는 물의 질을 관리하고, 물고기들에게 충분한 휴식을 제공하는 것이 중요합니다.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
