import 'package:build_test/class/class.dart';

List<Vaccine> vaccineList = [
  Vaccine("(주)씨티씨백", "씨티씨백 세균다자바 플러스", "연쇄구균(S. parauberis) 혈청형 3종(Ic, Ia, Ia)\n에드워드균(E. piscicida) 1종\n비브리오균(V. harveyi) 1종\n바이러스성 출혈성 패혈증 바이러스(VHSV)"),
  Vaccine("(주)씨티씨백", "씨티씨백 세균다자바", "연쇄구균(S. parauberis) 혈청형 3종(Ic, Ia, Ia)\n에드워드균(E. piscicida) 1종"),
  Vaccine("(주)씨티씨백", "씨티씨백 다자바 플러스", "스쿠티카 혈청형(M. avidus) 2종\n활주세균(T. maritimum) 1종\n바이러스성 출혈성 패혈증 바이러스(VHSV)"),
  Vaccine("(주)씨티씨백", "씨티씨백 다자바 주", "스쿠티카 혈청형(M. avidus) 2종\n활주세균(T. maritimum) 1종"),
  Vaccine("(주)코미팜", "프로백 TM 에스파라", "연쇄구균(S. parauberis) 혈청형 2종(Ia, Ib/c)"),
  Vaccine("(주)대성미생물연구소", "대성 VHS 피쉬백 주", "바이러스성 출혈성 패혈증 바이러스(VHSV)"),
  Vaccine("(주)고려비앤피", "윌로마린 S.E 4", "연쇄구균(S. iniae) 1종\n연쇄구균(S. parauberis) 혈청형 2종\n에드워드균(E. tarda) 1종"),
];

Vaccine findVaccine(String productName) {
  try {
    return vaccineList.firstWhere((vaccine) => vaccine.product == productName);
  } catch (e) {
    // 조건에 맞는 Vaccine이 없으면 null 반환
    return Vaccine("업체 정보가 없습니다.", "제품 정보가 없습니다.", "대상병원체 정보가 없습니다.");
  }
}