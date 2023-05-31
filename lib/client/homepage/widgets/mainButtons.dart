import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_theme.dart';
import '../../client_custom_drawer/home_drawer.dart';
import '../../find_offer/find_offer.dart';
import '../../navigation_home_screen.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "모아보기",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  letterSpacing: 0.2,
                  color: Colors.black
              )
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ////////////날짜별 버튼/////////////////////////////////////////////////
                TextButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => NavigationHomeScreen(pagename: DrawerIndex.Calendar)));
                    },
                    child: Container(
                      width: 120,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 245, 233, 1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 4)
                          )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                                Icons.calendar_today,
                              color: Colors.black,
                              size: 60
                            ),
                          Text(
                              "날짜별",
                              style: AppTheme.bigtextbuttons
                            ),
                        ],
                      ),
                    ),
                ),
                ////////////////태그별 버튼/////////////////////////////////////////
                TextButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => NavigationHomeScreen(pagename: DrawerIndex.Tags)));
                  },
                  child: Container(
                    width: 120,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 245, 233, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 4)
                        )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.label,
                            color: Colors.black,
                            size: 60
                        ),
                        Text(
                            "태그별",
                            style: AppTheme.bigtextbuttons
                        ),
                      ],
                    ),
                  ),
                ),
                /////////////////감정별버튼//////////////////////////////////////////
                TextButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => NavigationHomeScreen(pagename: DrawerIndex.Feelings)));
                  },
                  child: Container(
                    width: 120,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 245, 233, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 4)
                        )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.black,
                            size: 60
                        ),
                        Text(
                            "감정별",
                            style: AppTheme.bigtextbuttons
                        ),
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => NavigationHomeScreen(pagename: DrawerIndex.FindOffer)));
                },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: 390,
                height: 70,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 245, 233, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                        offset: Offset(0, 4)
                    )
                    ]
                ),
                child: Center(
                  child: Text(
                    "상담사 연결하기",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          letterSpacing: 0.2,
                          color: Colors.black
                      )
                  ),
                )
              )
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => WriteDiary()));
              },
              child: Container(
                margin: EdgeInsets.only(top:30, bottom: 40),
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