import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../adding_hw/adding_hw.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({Key? key}) : super(key: key);

  SideTitles get _bottom => SideTitles(
      showTitles: true,
      interval: 1.0,

      getTitlesWidget: (value, meta) {
        String text = '${value.toInt()}일';
        return Text(text);
      }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text('RemindDiary', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          actions: [],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text("김상담", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.grey,
                      width: 120,
                      height: 120,
                      child: Image.asset("images/user1.jpg")
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID : Kimcounselling"),
                        Text("성별 : 남"),
                        Text("생년월일 : 2002/08/19")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("감정 그래프", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              height: 170.0,
              width: 400.0,
              child: LineChart(
                LineChartData(
                    backgroundColor: Colors.black12,
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        left: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.transparent),
                        top: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      drawHorizontalLine: false,
                    ),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(sideTitles: _bottom),
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    minX: 14,
                    maxX: 19,
                    minY: 0,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            FlSpot(14,30),
                            FlSpot(15,40),
                            FlSpot(16,90),
                            FlSpot(17,50),
                            FlSpot(18, 20),
                            FlSpot(19, 40),
                          ]
                      )
                    ]
                ),
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 360,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,60,8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("그리스 여행", style: TextStyle(fontSize: 16),),
                                Text("2023/05/26", style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right:10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8,8,125,8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("벚꽃 구경", style: TextStyle(fontSize: 16),),
                                Text("2023/05/22", style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right:10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
          ],
        ),
        )
      ),
    );
  }
}