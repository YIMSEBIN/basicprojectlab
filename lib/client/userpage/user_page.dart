import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../app_theme.dart';


final images = [
  'images/movie2.png',
  'images/movie3.png',
  'images/movie1.png',
];

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
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
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        appBar(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("감정 그래프", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              height: 250.0,
              width: 375.0,
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
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
              ),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          i,
                          fit:BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow:[ BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                    ],
                  ),
                  child: Center(
                    child: Text("봄", style: TextStyle(color: Colors.black, fontSize: 14,)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow:[ BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                    ],
                  ),
                  child: Center(
                    child: Text("벚꽃", style: TextStyle(color: Colors.black, fontSize: 14,)),
                  ),
                ),
              ],
            ),
            Container(
              child: Text("동학사에 가서 꽃구경을 했다.", style: TextStyle(color: Colors.black, fontSize: 16,)),
              margin: EdgeInsets.fromLTRB(100, 15, 100, 40),
            ),
          ], // children
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