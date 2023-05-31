import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainImg extends StatefulWidget {
  String path = "";
  mainImg(String path) {
    this.path = path;
  }
  State<StatefulWidget> createState() => _mainImg(path);
}

class _mainImg extends State{
  String path = "";
  _mainImg(String path){
    this.path = path;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Positioned(
              child: Container(
                width: double.infinity,
                child: Image(
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              )
          ),
          Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 100, 0),
                          child: Text(
                              "2023/05/26",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  letterSpacing: 0.2,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 100, 20),
                          child: Text(
                              "영화제에서 영화 보고온 날",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  letterSpacing: 0.2,
                                  color: Colors.white
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 325),
                    child: TextButton(
                        onPressed: () { showAlert(); },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text(
                              "오늘 기록하기",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  letterSpacing: 0.2,
                                  color: Colors.white
                              )
                          ),
                        )
                    ),
                  )
                ],
              )
          )
        ],
      )
    );
  }
  void showAlert() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            actions: [
              Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black
                      ),
                      child: Text(
                        "입력",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    )
                  )
              )
            ],
            content: Container(
              width: 300,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              width: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage(path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            )
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "영화제",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "2023/05/26",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "이 날, 하늘은 무슨 색이었나요?",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black
                                      )
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          );
        },
        context: this.context
    );
  }
}