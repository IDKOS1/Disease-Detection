import 'dart:io';
import 'dart:typed_data';

import 'package:build_test/class/class.dart';
import 'package:build_test/layout/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'url_controller.dart';

class CameraPageController extends GetxController {
  static CameraPageController get to => Get.find();
  RxInt currentIndex = 0.obs;
  RxBool showSpinner = false.obs;
  final PageController pageController = PageController(keepPage: true);

  static List<String> imgName = [
    '유안측 0도',
    '유안측 45도',
    '유안측 90도',
    '유안측 분할 좌',
    '유안측 분할 우',
    '무안측 0도',
    '무안측 45도',
    '무안측 90도',
    '무안측 분할 좌',
    '무안측 분할 우',
    '아가미, 간 45도',
    '아가미, 간 90도',
    '아가미 뚜껑',
    '장, 비장 45도',
    '장, 비장 90도',
    '내장 제거 후 45도',
    '내장 제거 후 90도'
  ];

  static List<String> imgPath = [
    'imgs/guide_images/Guide01.png',
    'imgs/guide_images/Guide02.png',
    'imgs/guide_images/Guide03.png',
    'imgs/guide_images/Guide04.png',
    'imgs/guide_images/Guide05.png',
    'imgs/guide_images/Guide06.png',
    'imgs/guide_images/Guide07.png',
    'imgs/guide_images/Guide08.png',
    'imgs/guide_images/Guide09.png',
    'imgs/guide_images/Guide10.png',
    'imgs/guide_images/Guide11.png',
    'imgs/guide_images/Guide12.png',
    'imgs/guide_images/Guide13.png',
    'imgs/guide_images/Guide14.png',
    'imgs/guide_images/Guide15.png',
    'imgs/guide_images/Guide16.png',
    'imgs/guide_images/Guide17.png'
  ];

  final RxList<Guide> guideList = RxList<Guide>.from(
      List.generate(17, (index) => Guide(imgName[index], imgPath[index])));

  //비동기 처리를 통해 카메라와 갤러리에서 이미지 호출
  final RxList<Images> imageData = RxList<Images>.from(
      List.generate(17, (index) => Images(imgName[index], null)));

  final picker = ImagePicker();

  //Rx<File> currentPath = Rx<File>(File(''));
  Rx<String?> currentName = '유안측 0도'.obs;

  // 카메라 혹은 갤러리에서 불러온 이미지를 현재 선택한 부위와 동일 이름 리스트에 저장
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(
        source: imageSource, preferredCameraDevice: CameraDevice.rear);

    if (image != null) {
      for (int i = 0; i <= 16; i++) {
        if (imageData[i].name == currentName.toString()) {
          imageData[i].imgPath = File(image!.path);
          imageData.refresh();
        }
      }
    }
  }

  //촬영 이미지를 서버로 전송하는 코드
  Future imageUpload() async {
    var urlController = UrlController();
    showSpinner.value = true;

    final box = GetStorage();
    final root = urlController.url;

    final url = root.resolve('/register/uploadImage/');
    final request = http.MultipartRequest('POST', url);
    print("token = ${box.read('token')}");
    request.headers['Authorization'] = 'Token ${box.read('token')}';

    // 각 이미지별 처리하는 코드
    for (int i = 0; i < imageData.length; i++) {
      if (imageData[i].imgPath != null) {
        // 이미지 파일 읽기
        final file = File(imageData[i].imgPath!.path);
        final imageBytes = await file.readAsBytes();

        // image_gallery_saver_plus를 사용하여 이미지 저장
        try {
          final result = await ImageGallerySaverPlus.saveImage(
              Uint8List.fromList(imageBytes));
          print('save result = $result');
        } catch (e) {
          print('Error saving image: $e');
        }

        // 서버로 업로드할 파일 추가
        request.files.add(
          await http.MultipartFile.fromPath('image_$i', file.path),
        );
      }
    }

    // 서버에 요청 보내고 응답 받기
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // 업로드 성공
        print('Upload successful');
        // showSpinner.value = false;
        for (int i = 0; i < imageData.length; i++) {
          imageData[i].imgPath = null;
        }
        toastmsg('업로드 완료');
        Get.back();
      } else if (response.statusCode == 401) {
        toastmsg('로그인 정보가 없습니다.');
      } else {
        // 업로드 실패
        print('Upload failed with status ${response.statusCode}');
        // showSpinner.value = false;
        toastmsg('업로드 실패');
      }
    } catch (e) {
      // 오류 처리
      print('Error uploading: $e');
      // showSpinner.value = false;
      toastmsg('오류 발생');
    }
    showSpinner.value = false;
  }

  void pageChanged(int index) {
    currentName.value = imageData[index].name;
    currentIndex.value = index;
    pageController.jumpToPage(index);
    print('current index = ${index}');
    print('index.value = ${currentIndex.value}');
    print('name.value= ${currentName.value}');
  }

  void SlidepageChanged(int index) {
    currentName.value = imageData[index].name;
    currentIndex.value = index;

    print('current index = ${index}');
    print('index.value = ${currentIndex.value}');
    print('name.value= ${currentName.value}');
  }

  Future imageSave() async {
    for (Images item in imageData) {
      if (item.imgPath != null) {
        try {
          // 이미지 파일 경로에서 바이트 데이터 읽기
          final file = File(item.imgPath!.path);
          final imageBytes = await file.readAsBytes();

          // image_gallery_saver_plus를 사용하여 이미지 저장
          final result = await ImageGallerySaverPlus.saveImage(
              Uint8List.fromList(imageBytes));
          print('save result = $result');
        } catch (err) {
          print('error : ($err)');
        }
      } else {
        toastmsg('선택 이미지 없음');
      }
    }

    toastmsg("저장 되었습니다.");
  }
}
