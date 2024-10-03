import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelfDiagnosisDate extends StatefulWidget {
  const SelfDiagnosisDate({super.key});

  @override
  _SelfDiagnosisDateState createState() => _SelfDiagnosisDateState();
}

class _SelfDiagnosisDateState extends State<SelfDiagnosisDate> {
  List<String> farmList = ['1번 양식장', '2번 양식장', '3번 양식장', '4번 양식장'];
  String selectedFarm = '1번 양식장';

  Widget farmDropdown() {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: selectedFarm,
        onChanged: (String? value) {
          setState(() {
            selectedFarm = value!;
            print('farm: $selectedFarm');
          });
        },
        items: farmList.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        dropdownColor: Colors.grey,
        // 추가: 드롭다운 배경색 변경
        underline: const SizedBox(),
        // 추가: 드롭다운 하단의 밑줄 제거
        isExpanded: true, // 추가: 드롭다운 확장 여부 설정
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "날짜",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // 텍스트와 입력 필드 사이의 간격 추가
            Row(
              children: [
                // '년' 텍스트 필드 (최대 4자리)
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4), // 최대 4자리 숫자
                        FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                      ],
                      decoration: InputDecoration(
                        hintText: '년',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // '월' 텍스트 필드 (최대 2자리)
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2), // 최대 2자리 숫자
                        FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                      ],
                      decoration: InputDecoration(
                        hintText: '월',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // '일' 텍스트 필드 (최대 2자리)
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2), // 최대 2자리 숫자
                        FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                      ],
                      decoration: InputDecoration(
                        hintText: '일',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // '시' 텍스트 필드 (최대 2자리)
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2), // 최대 2자리 숫자
                        FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                      ],
                      decoration: InputDecoration(
                        hintText: '시',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // '분' 텍스트 필드 (최대 2자리)
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2), // 최대 2자리 숫자
                        FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                      ],
                      decoration: InputDecoration(
                        hintText: '분',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "양식장 지역",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            farmDropdown(),
            SizedBox(height: 16),
            Text(
              "넙치 길이",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '소수점 한자리까지 입력',
                      ),
                    ),
                  ),
                  Text(
                    'cm', // 고정된 텍스트
                    style: TextStyle(
                      color: Colors.black54, // 텍스트 색상
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "넙치 무게",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '소수점 한자리까지 입력',
                      ),
                    ),
                  ),
                  Text(
                    'g', // 고정된 텍스트
                    style: TextStyle(
                      color: Colors.black54, // 텍스트 색상
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "수온",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '소수점 한자리까지 입력',
                      ),
                    ),
                  ),
                  Text(
                    '℃', // 고정된 텍스트
                    style: TextStyle(
                      color: Colors.black54, // 텍스트 색상
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
