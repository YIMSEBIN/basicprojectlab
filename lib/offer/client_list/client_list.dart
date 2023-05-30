import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import '../client_info/client_info.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> with TickerProviderStateMixin {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          appBar(),
      Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("내담자 리스트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              ),

              SizedBox(height: 20),
              Container(
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
                    children: [
                      SizedBox(width: 20),  // 좌측에 간격을 주기 위한 SizedBox
                      Container(
                        color: Colors.grey,
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment(-1.0,1.0),
                          child: Text(
                            '김상담',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,30,0,0),
                            child: Column(
                              children:[
                                Text("성별 : 남" , style: TextStyle(fontSize: 20),),
                                Text("생년월일 : 2002/08/19", style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              SizedBox(height: 20),
              Container(
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
                    children: [
                      SizedBox(width: 20),  // 좌측에 간격을 주기 위한 SizedBox
                      Container(
                        color: Colors.grey,
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment(-1.0,1.0),
                          child: Text(
                            '김상담',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,30,0,0),
                            child: Column(
                              children:[
                                Text("성별 : 남" , style: TextStyle(fontSize: 20),),
                                Text("생년월일 : 2002/08/19", style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              SizedBox(height: 20),
              Container(
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
                    children: [
                      SizedBox(width: 20),  // 좌측에 간격을 주기 위한 SizedBox
                      Container(
                        color: Colors.grey,
                        width: 70,
                        height: 70,
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment(-1.0,1.0),
                          child: Text(
                            '김상담',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,30,0,0),
                            child: Column(
                              children:[
                                Text("성별 : 남" , style: TextStyle(fontSize: 20),),
                                Text("생년월일 : 2002/08/19", style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 60,
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: Text("과제 추가", style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                ),
              ),
            ]
        ),

      ]),
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