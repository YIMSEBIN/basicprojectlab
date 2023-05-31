import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../diary/diary_navigation.dart';

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> with TickerProviderStateMixin {
  List<String> tags = [];
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
                                  labelText: '태그 검색',
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
                                tags.add(_searchcontroller.text);
                              });
                            },
                            icon: Icon(Icons.search)
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<bool>(
                        future: getData(),
                        builder:
                            (BuildContext context, AsyncSnapshot<bool> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox();
                          } else {
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Wrap(
                                          spacing : 8.0,
                                          runSpacing: 4.0,
                                          children:
                                          tags.map((String name) =>
                                              Chip(
                                                avatar: CircleAvatar(child : Text("#")),
                                                label : Text(name),
                                                deleteIcon: Icon(Icons.delete),
                                                onDeleted: () {
                                                  setState(() {
                                                    tags.removeAt(tags.indexOf(name));
                                                  });
                                                },
                                              )
                                          ).toList(),
                                        )
                                      )
                                    ]
                                )
                            );
                          }
                        },
                      ),
                    ),
                  ]
              )
              ),
              Center(
                    child:Container(
                      margin:EdgeInsets.fromLTRB(20, 10, 20, 40),
                      width: 500,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
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
                          label: Text("검색하러 가기"),
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
