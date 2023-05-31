import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../diary/diary_navigation.dart';

class FindOffer extends StatefulWidget {
  const FindOffer({Key? key}) : super(key: key);

  @override
  _FindOfferState createState() => _FindOfferState();
}

class _FindOfferState extends State<FindOffer> with TickerProviderStateMixin {
  bool multiple = true;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchcontroller = TextEditingController();

    return Scaffold(
        body : Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Expanded(
                  child:Column(
                      children:[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top:20, right:10),
                                  child: TextField(
                                    controller: _searchcontroller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '상담사의 ID, 이름, 병원...',
                                      helperText: '',
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                //padding: EdgeInsets.zero, // 패딩 설정
                                  constraints: BoxConstraints(),
                                  onPressed: () {
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(Icons.search)
                              )
                            ],
                          ),
                        ),
                      ]
                  )
              ),
              Column(
                children: [
                  Center(
                      child:Container(
                        margin:EdgeInsets.fromLTRB(20, 10, 20, 0),
                        width: 500,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black87,
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
                              Navigator.push(context,MaterialPageRoute(builder: (context) => DiaryNavigation()));
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text("연결"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                )
                            )
                        ),
                      )
                  ),
                  Center(
                      child:Container(
                        margin:EdgeInsets.fromLTRB(20, 10, 20, 40),
                        width: 500,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                              Navigator.push(context,MaterialPageRoute(builder: (context) => DiaryNavigation()));
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text("취소"),
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
                  ),
                ],
              )

            ],
          ),
        ));
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
