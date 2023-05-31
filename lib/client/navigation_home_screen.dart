import 'find_offer/find_offer.dart';
import 'homework_list/homework_list.dart';
import 'tags/tags.dart';
import 'userpage/user_page.dart';

import '../app_theme.dart';
import 'calendar/calendar.dart';
import 'client_custom_drawer/drawer_user_controller.dart';
import 'client_custom_drawer/home_drawer.dart';
import 'feelings/feelings.dart';
import 'homepage/main_page.dart';
import 'package:flutter/material.dart';

// 햄버거 메뉴 클릭 시 나옴
class NavigationHomeScreen extends StatefulWidget {
  DrawerIndex pagename;
  NavigationHomeScreen({Key? key, required this.pagename}): super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  // 변수명 뒤에 ?이 붙은것은 null이 될 수 있다는 의미
  Widget? screenView;
  DrawerIndex? drawerIndex;

  // 이 위젯이 로드될때 필요한 초기화를 진행함.
  @override
  void initState() {
    drawerIndex = widget.pagename;
    changeIndex(drawerIndex!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    drawerIndex = drawerIndexdata;
    switch (drawerIndex) {
    // 첫 메인페이지 (피그마에서 2번페이지)
      case DrawerIndex.HOME:
        setState(() {
          screenView = const MyHomePage();
        });
        break;
    // 달력 (피그마에서 4번페이지)
      case DrawerIndex.Calendar:
        setState(() {
          // screenView = HelpScreen();
          screenView = const Calendar();
        });
        break;
    // 감정별 모아보기 (피그마에서 3번 페이지)
      case DrawerIndex.Feelings:
        setState(() {
          // screenView = FeedbackScreen();
          screenView = Feelings();
        });
        break;
    // 태그별 모아보기 (피그마에서 5번 페이지)
      case DrawerIndex.Tags:
        setState(() {
          // screenView = InviteFriend();
          screenView = const Tags();
        });
        break;
    // 숙제 모아보기 (피그마에서 8번 페이지)
      case DrawerIndex.Homeworks:
        setState(() {
          // screenView = InviteFriend();
          screenView = HomeworkList();
        });
        break;
    // 마이페이지 (피그마에서 8번 페이지)
      case DrawerIndex.User:
        setState(() {
          // screenView = InviteFriend();
          screenView = const UserPage();
        });
        break;
    // 마이페이지 (피그마에서 8번 페이지)
      case DrawerIndex.FindOffer:
        setState(() {
          // screenView = InviteFriend();
          screenView = const FindOffer();
        });
        break;
      default:
        break;
    }
  }
}
