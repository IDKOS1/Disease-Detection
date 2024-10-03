import 'package:flutter/material.dart';

class DiseaseTrends extends StatelessWidget {
  const DiseaseTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("환경정보",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "질병 발생 동향",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("주요 세균성 질병 발생 동향 ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
