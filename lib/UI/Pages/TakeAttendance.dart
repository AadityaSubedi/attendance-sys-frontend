// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:attendance_sys/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '../../function.dart';

class TakeAttendanceScreen extends StatefulWidget {
  const TakeAttendanceScreen({Key? key}) : super(key: key);

  static const routeName = "/takeattendance";

  // final Map<String, String?> body;

  @override
  _TakeAttendanceScreenState createState() => _TakeAttendanceScreenState();
}

class _TakeAttendanceScreenState extends State<TakeAttendanceScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var _isInit = true;
  var _isLoading = false;
  Map<String, String?>? _body;

  String? _error;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _body = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final token = Provider.of<Auth>(context).token;
      try {
        // fetch classname and subject name
        var data = await fetchData("${BACKEND_URL}/api/takeattendance",
            body: _body, method: "POST", token: token);

        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        setState(() {
          _isLoading = false;
          _error = error as String;
        });
      }

      _isInit = false;
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
        child: AppBar(
          backgroundColor: Color(0xFF265784),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.5, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                  child: Text(
                    'Smart \nAttendance',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.95, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.015,
                  decoration: BoxDecoration(
                    color: Color(0xFF265784),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.85, 0),
                child: InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Are you sure to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(alertDialogContext);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogInScreen(),
                                  ),
                                );
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0, 0.15),
              child: InkWell(
                onTap: () async {
                  await Navigator.of(context)
                      .pushNamed(DashboardScreen.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/2123.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? CircularProgressIndicator()
          : SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      '$BACKEND_URL/api/getstream/${double.parse("${_body!["time"]}")}',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
