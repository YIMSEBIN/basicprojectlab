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
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text('RemindDiary', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: Column(
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
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black26,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID : Kimcounselling"),
                        Text("성별 : 여"),
                        Text("생년월일 : 2000/01/23")
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
              width: 300.0,
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
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,60,8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("그리스로 놀러갔던 날", style: TextStyle(fontSize: 16),),
                              Text("2023/05/26", style: TextStyle(color: Colors.black45),),
                            ],
                          ),
                        ),
                        Container(
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
                    width: 250,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,8,125,8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("벚꽃 구경", style: TextStyle(fontSize: 16),),
                              Text("2023/05/22", style: TextStyle(color: Colors.black45),),
                            ],
                          ),
                        ),
                        Container(
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
            ),Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: 300,
                height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 3.0,
                    spreadRadius: 5.0,
                  ),],
              ),
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddHomework()));
                },
                child: Text("과제 추가", style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                 ),)
              ))],
        ),
      ),
    );
  }
}