
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_theme.dart';
import '../../module_diary.dart';
import '../navigation_home_screen.dart';
import '../client_custom_drawer/home_drawer.dart';
import 'accessButton.dart';

// final images = [
//   'images/movie1.png',
//   'images/movie2.png',
//   'images/movie3.png',
// ];

class WriteDiary extends StatefulWidget {
  const WriteDiary({super.key});

  @override
  State createState() => _uploadNewPost();
}

class _uploadNewPost extends State {
  final tagText = TextEditingController();

  String? getEmail(){
    final user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  List<String> tags = [];
  void addTag() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text(
              "태그 추가하기",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    tags.add(tagText.text);
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  "추가",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "닫기",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ))
            ],
            content: TextField(
              controller: tagText,
            ),
          );
        },
        context: this.context
    );
  }

  String emotion = "";
  int emotionIndex = 0;
  List emotionArr = [Colors.red, Colors.orange, Colors.yellow, Colors.lightGreenAccent, Colors.lightBlueAccent];
  Container emotionCircle = Container(
    width: 200,
    height: 200,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.amberAccent,
    ),
  );

  void selectEmotion() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "감정 변경하기",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "닫기",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ))
              ],
              content: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        emotionIndex = 0;
                        emotion = "화남";
                        Navigator.pop(context);
                      },
                      child: Text(
                        "화남",
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        emotionIndex = 1;
                        emotion = "신남";
                        Navigator.pop(context);
                      },
                      child: Text(
                        "신남",
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        emotionIndex = 2;
                        emotion = "기쁨";
                        Navigator.pop(context);
                      },
                      child: Text(
                        "기쁨",
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        emotion = "즐거움";
                        emotionIndex = 3;
                        Navigator.pop(context);
                      },
                      child: Text(
                        "즐거움",
                      )
                  ),
                  TextButton(
                      onPressed: () {
                        emotion = "슬픔";
                        emotionIndex = 4;
                        Navigator.pop(context);
                      },
                      child: Text(
                        "슬픔",
                      )
                  ),
                ],
              )
          );
        },
        context: this.context
    );
  }

  TextEditingController _writediarycontroller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<String> _pickedImgs = [];

  Future _pickImg() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImgs.add(image.path);
      });
    }
    print(_pickedImgs[0]);
  }

  DateTime? _selectedDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  emotionCircle
                                ],
                              ),
                            ),
                            Container(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 250.0,
                                    enableInfiniteScroll: false,
                                  ),
                                  items: _pickedImgs.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          margin: EdgeInsets.fromLTRB(
                                              10, 40, 10, 0),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 10.0,
                                                  spreadRadius: 2.0,
                                                )
                                              ]
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  10.0),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(i)
                                              )
                                            ),
                                          )
                                        );
                                      },
                                    );
                                  }).toList(),
                                )
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:40,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tags.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(
                                              5)),
                                          color: Colors.grey
                                      ),
                                      child: Text(
                                        '# ${tags[index]}',
                                        style: AppTheme.textbuttons
                                      ),
                                    );
                                  },
                                ),)
                              ]
                            )
                        )
                      ],
                    )
                ),
                Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100)
                                          ).then((selectedDate) {
                                            setState(() {
                                              _selectedDate = selectedDate;
                                            });
                                          });
                                        },
                                        child: Text(
                                          _selectedDate != null
                                              ? _selectedDate.toString().split(" ")[0]
                                              : "날짜 선택",
                                          style: AppTheme.textbuttons
                                        )
                                    ),
                                    ],
                                  )
                                ),
                                Container(
                                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
                                    child : TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 8,
                                      controller: _writediarycontroller,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black
                                      ),
                                    )
                                )
                              ],
                            )
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        addTag();
                                      },
                                      child: Text(
                                        "태그추가",
                                        style: AppTheme.textbuttons
                                      )
                                  ),
                                  TextButton(
                                    onPressed: () { selectEmotion(); },
                                    child: Text(
                                      "감정변경",
                                      style: AppTheme.textbuttons
                                    ),),
                                  TextButton(
                                    onPressed: () {
                                      _pickImg();
                                    },
                                    child: Text(
                                      "사진 추가",
                                      style: AppTheme.textbuttons
                                    ),),
                                ],
                              ),
                                SizedBox(height:20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        _addDiary(Diary(contents: _writediarycontroller.text, tags: tags, feeling: emotion, imageUrl: _pickedImgs, date:_selectedDate.toString().split(" ")[0]));
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => NavigationHomeScreen(pagename: DrawerIndex.HOME)));
                                      },
                                      child: Text(
                                        "저장",
                                        style: AppTheme.textbuttons
                                      ),),
                                    accessButton()
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    )
                )
              ],
            )
        )
    );
  }

  void _addDiary(Diary diary) {
    setState(() {
      FirebaseFirestore.instance
          .collection(getEmail()!)
          .add({'contents': diary.contents, 'tags': diary.tags, 'feeling' : diary.feeling, 'imageUrl': diary.imageUrl, 'date': diary.date});
      _writediarycontroller.text = "";
    });
  }
}
