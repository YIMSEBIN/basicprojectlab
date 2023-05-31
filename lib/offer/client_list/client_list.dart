import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import '../adding_hw/adding_hw.dart';
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
          Expanded(
            child: Column(
            children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("내담자 리스트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ClientInfo()));
                },
                child:Container(
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
                        Container(
                          margin: EdgeInsets.only(left:20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  color: Colors.grey,
                                  width: 70,
                                  height: 70,
                                  child: Image.asset("images/user1.jpg")
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
                    )
                ),
            ),
            SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ClientInfo()));
                },
                child:Container(
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
                        Container(
                          margin: EdgeInsets.only(left:20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  color: Colors.grey,
                                  width: 70,
                                  height: 70,
                                  child: Image.asset("images/user2.jpg")
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment(-1.0,1.0),
                                  child: Text(
                                      '이상담',
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
                              Text("성별 : 여" , style: AppTheme.caption),
                              Text("생년월일 : 2001/10/29", style:AppTheme.caption),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
            SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ClientInfo()));
                },
                child:Container(
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
                        Container(
                          margin: EdgeInsets.only(left:20),
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
                                      '최상담',
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
                              Text("생년월일 : 1999/08/30", style: AppTheme.caption),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddHomework()));
                },
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 60,
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text("과제 추가", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 0.2,
                  color: Colors.white
              )),
            ),
            )
          ]
      ),)

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