import 'package:flutter/material.dart';

class EnvironmentalDetail extends StatelessWidget {
  final String images;

  const EnvironmentalDetail({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity, // 부모 위젯의 가로 길이를 가득 채움
            child: Image.asset(
              'images/environmental/$images',
              fit: BoxFit.cover, // 이미지 비율에 맞게 조절
            ),
          )
        ],
      ),
    );
  }
}
