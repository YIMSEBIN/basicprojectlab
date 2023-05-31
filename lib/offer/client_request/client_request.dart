import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class ClientRequest extends StatefulWidget {
  const ClientRequest({Key? key}) : super(key: key);

  @override
  _ClientRequestState createState() => _ClientRequestState();
}

class _ClientRequestState extends State<ClientRequest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Text("내담자 요청", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                    ),
                    Expanded(
                      child:Column(
                        children: [Container(
                            width: 400,
                            height: 120,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(10,10),
                                  color: Colors.black.withOpacity(0.3),
                                )
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left:20),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  color: Colors.grey,
                                                  width: 70,
                                                  height: 70,
                                                  child: Image.asset("images/user3.jpg")
                                              ),
                                              Container(
                                                child: Align(
                                                  alignment: Alignment(-1.0,1.0),
                                                  child: Text(
                                                      '김상담',
                                                      style:AppTheme.textbuttons
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left:20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              Text("성별 : 남" , style: AppTheme.caption),
                                              Text("생년월일 : 2002/08/19", style: AppTheme.caption),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right:20),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                child: Center(
                                                  child: Align(
                                                    alignment: FractionalOffset.bottomCenter,
                                                    child: Container(
                                                      width: 50,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        border: Border.all(
                                                          width: 1,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text( '거절', // 박스 안에 들어갈 텍스트
                                                          style: TextStyle(
                                                            color: Colors.black, // 텍스트의 색상
                                                            fontSize: 10, // 텍스트의 크기
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ),
                                            Container(
                                                child: Center(
                                                    child: Align(
                                                        alignment: FractionalOffset.bottomCenter,
                                                        child: Container(
                                                          width: 50,
                                                          height: 30,
                                                          color: Colors.black,
                                                          child: Center(
                                                            child: Text(
                                                              '승인', // 박스 안에 들어갈 텍스트
                                                              style: TextStyle(
                                                                color: Colors.white, // 텍스트의 색상
                                                                fontSize: 10, // 텍스트의 크기
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                    )
                                                )
                                            ),
                                          ]
                                      )
                                  )
                                ]
                            )
                        ),]
                      )
                    ),

                    Center(
                        child:Container(
                          margin:EdgeInsets.fromLTRB(20, 10, 20, 40),
                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 3.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(0, 4)
                              )
                              ]
                          ),
                          child:ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back),
                              label: Text("뒤로가기"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  )
                              )
                          ),
                        )
                    )
                  ]
              )
            )
    ])
    );
  }


  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'Remind Diary',
                style: TextStyle(
                  fontSize: 22,
                  color: isLightMode ? AppTheme.darkText : AppTheme.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}