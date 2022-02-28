import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'UI/Pages/Register.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'UI/Pages/Dashboard.dart';

Color colrorPrimary = HexColor('#265784');
Color colorSecondary = HexColor("#ea734d");
Color colorTertiary = HexColor("#88b74093");

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(255, 38, 87, .1),
      100: Color.fromRGBO(255, 38, 87, .2),
      200: Color.fromRGBO(255, 38, 87, .3),
      300: Color.fromRGBO(255, 38, 87, .4),
      400: Color.fromRGBO(255, 38, 87, .5),
      500: Color.fromRGBO(255, 38, 87, .6),
      600: Color.fromRGBO(255, 38, 87, .7),
      700: Color.fromRGBO(255, 38, 87, .8),
      800: Color.fromRGBO(255, 38, 87, .9),
      900: Color.fromRGBO(255, 38, 87, 1),
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
            title: 'Attendance system',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: MaterialColor(0xFF265784, color),
            ),
            home:auth.isAuth?  DashboardScreen():  LogInScreen(),
            routes: {
              LogInScreen.routeName: (ctx) =>  LogInScreen(),
              RegisterScreen.routeName: (ctx) =>  RegisterScreen(),
              DashboardScreen.routeName: (ctx) =>  DashboardScreen(),

              // TODO: Add other routes too
            }),
      ),
    );
  }
}
