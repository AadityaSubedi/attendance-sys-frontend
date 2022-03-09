// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:attendance_sys/UI/Pages/Attendance.dart';
import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:attendance_sys/main.dart';
import 'package:attendance_sys/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../function.dart';

class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "/attendancelist";

  @override
  _AttendanceListScreenState createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  var _isLoading = false;
  var _datedata;
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
        var data = await fetchData('$BACKEND_URL/api/getattendancelist',
            body: _body, method: "GET", token: token);

        setState(() {
          _datedata = data;
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
    var dates = _datedata.keys.toList();
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
                              onPressed: () {},
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
                onTap: () {},
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Color(0xFF265784),
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0,
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(0),
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.6, 0),
                                  child: Text(
                                    'Class Name:    ${_body!["classname"]}\nSubject Name: ${_body!["subjectname"]}',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF265784),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: dates.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      var body = {
                                        "classname": _body!["classname"],
                                        "subjectname": _body!["subjectname"],
                                        "date": dates[index],
                                        "attendance": _datedata[dates[index]],
                                      };
                                      Navigator.of(context).pushNamed(
                                          AttendanceScreen.routeName,
                                          arguments: body);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        dates[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          color: colrorPrimary,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              35, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
