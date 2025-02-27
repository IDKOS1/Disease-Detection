import 'dart:ui';

import 'package:build_test/get_controller/url_controller.dart';
import 'package:build_test/screen/login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingPage extends StatefulWidget {
  SettingPage();

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final controller = Get.put(UrlController());

  final TextEditingController _name = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String name = box.read('name') ?? '이름 정보 없음';
    String email = box.read('email') ?? '이메일 정보 없음';
    String farm = box.read('farm') ?? '농장 정보 없음';

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverAppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.blue,
              floating: true,
              pinned: false,
              centerTitle: true,
              title: Text('내 정보',
                style: TextStyle(color: Colors.white),
              ),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)
                  )
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  infoWidget('이름', name),
                  infoWidget('이메일', email),
                  infoWidget('양식장', farm),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                      onPressed: () async {
                        box.remove('token');
                        print('token: ${box.read('toekn')}');
                        Get.offAll(() => LoginPage());
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text('로그아웃')),

                  // 토큰 확인 버튼
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       bool isTrue = await controller.checkToken();
                  //       print('bool = ${isTrue}');
                  //       toastmsg('${box.read('token')}');
                  //     },
                  //     child: Text('Check Token')),
                  // 업로드 결과 확인 버튼
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       await controller.loadResult();
                  //     },
                  //     child: Text('length result'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoWidget(String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.2))
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => ChangeInfo(info: title));
            },
            child: Row(
              children: [
                Text(content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget component1(String hintText, int key, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 17,
      width: size.width / 1.4,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        key: ValueKey(key),
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

class ChangeInfo extends StatelessWidget {
  final String info;

  const ChangeInfo({Key? key,
    required this.info
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.blue,
                floating: true,
                pinned: false,
                centerTitle: true,
                title: Text('$info 수정',
                  style: TextStyle(color: Colors.white),
                ),
                shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}




