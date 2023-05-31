import 'package:flutter/material.dart';

class ClientCheck extends StatelessWidget {
  String name = '박상담';
  String gender = '여성';
  String birthday = '2000/01/23';
  String imagePath = 'images/user1.jpg'; // 이미지 파일 경로 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 버튼을 눌렀을 때 수행할 동작 추가
              // 예를 들면, 드로어(Drawer) 열기 등
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              color: Colors.white, // 사각형의 배경색
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '이름: $name',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '성별: $gender',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '생년월일: $birthday',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 연결 버튼을 눌렀을 때 수행할 동작 추가
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 30), // 가로 길이 조정
                  ),
                  child: Text('연결'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // 취소 버튼을 눌렀을 때 수행할 동작 추가
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 30), // 가로 길이 조정
                  ),
                  child: Text('취소'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}