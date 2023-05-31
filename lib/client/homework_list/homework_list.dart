import 'package:flutter/material.dart';

import '../../app_theme.dart';

class HomeworkList extends StatelessWidget {
  final List<ButtonData> buttons = [
    ButtonData(
      title: '일기 하루에 하나씩 쓰기',
      dateText: '2023. 12. 10 ~ 2023. 12. 20',
      isChecked: true,
    ),
    ButtonData(
      title: '일기 하루에 하나씩 쓰기',
      dateText: '2023. 12. 17 ~ 2023. 12. 25',
      isChecked: true,
    ),
    ButtonData(
      title: '이틀에 하나씩 일기 쓰기',
      dateText: '2023. 12. 27 ~ 2023. 12. 31',
      isChecked: false,
    ),
    // 다른 버튼들도 추가할 수 있습니다.
  ];

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
            child: ListView.builder(
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(buttons[index].title),
                  subtitle: Text(buttons[index].dateText),
                  trailing: buttons[index].isChecked
                      ? Icon(Icons.check) // 원 안에 체크 표시
                      : Icon(Icons.remove), // 원 안에 "-" 표시
                  onTap: () {
                    // 버튼을 눌렀을 때 수행할 동작
                  },
                );
              },
            ),
        )
    ]));
  }

  Widget appBar() {
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
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                'Remind Diary',
                style: TextStyle(
                  fontSize: 22,
                  color: AppTheme.white,
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

class ButtonData {
  final String title;
  final String dateText;
  final bool isChecked;

  ButtonData({
    required this.title,
    required this.dateText,
    required this.isChecked,
  });
}