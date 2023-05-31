import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../app_theme.dart';

final images = [
  'images/movie1.png',
  'images/movie2.png',
  'images/movie3.png'
];

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
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
    return Column(
      children: [
        appBar(),
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: TableCalendar(
            firstDay: DateTime.utc(2023, 01, 01),
            lastDay: DateTime.utc(2023, 12, 31),
            focusedDay: DateTime.now(),
            eventLoader: (day){
              if(day.day==5) {
                return ['event'];
              }
              return [];
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/tower.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(7.0),
              ),
              markerSize: 40.0,
              markersAlignment: Alignment.topCenter,
              outsideDaysVisible: false,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
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
        )
      ],
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