import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';
import '../../calendar/calendar.dart';
import '../../feelings/feelings.dart';
import '../../find_offer/find_offer.dart';
import '../../tags/tags.dart';
import '../../write_diary/write_diary.dart';

class mainButton extends StatefulWidget {
  State<StatefulWidget> createState() => _mainButton();
}

class _mainButton extends State{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            child: Text(
              "모아보기",
              style: AppTheme.bigtextbuttons
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ////////////날짜별 버튼/////////////////////////////////////////////////
                TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Calendar()));
                    },
                    child: Container(
                      width: 140,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 245, 233, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 6)
                          )
                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image(
                              image: AssetImage("icons/calendar.png"),
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "날짜별",
                              style: AppTheme.bigtextbuttons
                            ),
                          )
                        ],
                      ),
                    ),
                ),
                ////////////////태그별 버튼/////////////////////////////////////////
                TextButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Tags()));
                  },
                  child: Container(
                    width: 140,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 245, 233, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 6)
                        )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image(
                            image: AssetImage("icons/tag.png"),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "태그별",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /////////////////감정별버튼//////////////////////////////////////////
                TextButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Feelings()));
                  },
                  child: Container(
                    width: 140,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 245, 233, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 6)
                        )
                        ]
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image(
                            image: AssetImage("icons/happy.png"),
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "감정별",
                            style: AppTheme.bigtextbuttons
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ////////////////////상담사 연결 버튼 ///////////////////////////////////////
          TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => FindOffer()));
                },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 245, 233, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 6)
                    )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    "상담사 연결하기",
                    style: AppTheme.bigtextbuttons
                  ),
                  ],
                )
              )
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => WriteDiary()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 6)
                    )
                  ]
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "글쓰기",
                      style: AppTheme.bigtextbuttons
                    )
                  ],
                )
                ),
              )
        ],
      ),
    );
  }
}