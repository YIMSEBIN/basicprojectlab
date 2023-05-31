import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'client/client_custom_drawer/home_drawer.dart';
import 'firebase_options.dart';
import 'login/login.dart';
import 'login/model_auth.dart';
import 'login/register.dart';
import 'logo.dart';
import 'client/navigation_home_screen.dart';
import 'offer/offer_navigation_home_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized()는 runApp으로 앱이 실행되기 전에 비동기로 지연이 되더라도 오류가 발생하지 않도록 하는 역할을 한다.
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp()은 앱을 실행할 때 Firebase를 비동기 방식으로 초기화하도록 한다.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 화면 세로모드로 강제 고정
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        // ChangeNotifierProvider(create: (_) => DiaryProvider()),
      ],
      child: MaterialApp(
          title: 'REMIND DIARY',
        debugShowCheckedModeBanner: false,
        routes: {
          '/clienthome': (context) => NavigationHomeScreen(pagename: DrawerIndex.HOME),
          '/offerhome': (context) => const OfferNavigationHomeScreen(),
          '/login': (context) => LoginPage(),
          '/splash': (context) => SplashScreen(),
          '/register': (context) => RegisterPage(),
        },
        // theme: ThemeData(
        //   primaryColor: Colors.white,
        //   textTheme: AppTheme.textTheme,
        //   platform: TargetPlatform.iOS,
        // ),
        initialRoute: '/splash'
      ),
    );
  }
}

// class HexColor extends Color {
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
//
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll('#', '');
//     if (hexColor.length == 6) {
//       hexColor = 'FF' + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
// }