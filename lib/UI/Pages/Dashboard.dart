// import '../flutter_flow/flutter_flow_drop_down.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';

// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, prefer_const_constructors

//import 'package:attendancesys_flutter/Screens/LogIn.dart';
import 'dart:convert';

import 'package:attendance_sys/UI/Pages/AttendanceList.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:attendance_sys/UI/Pages/StudentInfo.dart';
import 'package:attendance_sys/function.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late String dropDownValue1;
  late String dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> subjects = [
    'AI',
    'DBMS',
    'OOAD',
    'Operating System',
    'Embedded System'
  ];
  List<String> classes = ['075BCTAB', '075BCTCD', '075BCEAB', '075BCECD'];
  String? subChoose;
  String? classsChoose;
  // late final url = '';

  List<DropdownMenuItem<String>> getList(lists) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String each in lists) {
      var newItem = DropdownMenuItem(
        child: Text(
          each,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: Color(0xFF265784),
          ),
        ),
        value: each,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
        child: AppBar(
          backgroundColor: const Color(0xFF265784),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.only(right: 20, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
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
                // Align(
                //   alignment: const AlignmentDirectional(0.95, 0),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width * 0.2,
                //     height: MediaQuery.of(context).size.height * 0.015,
                //     decoration: const BoxDecoration(
                //       color: Color(0xFF265784),
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.centerRight,
                  // const AlignmentDirectional(0.85, 0),
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
                                      builder: (context) => const LogInWidget(),
                                    ),
                                  );
                                  ;
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
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0, 0.15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/images/2123.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
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
                          color: const Color(0xFF265784),
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
                            borderRadius: const BorderRadius.only(
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
                        children: const [
                          Align(
                            alignment: AlignmentDirectional(-0.6, 0),
                            child: Text(
                              'Full Name Here',
                              style: TextStyle(
                                fontFamily: 'Roboto',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: SizedBox(
                    width: 230,
                    child: DropdownButton<String>(
                      hint: Text(
                        'Choose Subject',
                        style: TextStyle(
                          color: HexColor('#265784'),
                        ),
                      ),
                      isExpanded: true,
                      value: subChoose,
                      //icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(color: HexColor('#265784')),
                      underline: Container(
                        height: 2,
                        color: HexColor('#265784'),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          subChoose = newValue!;
                        });
                      },
                      items: getList(subjects),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: SizedBox(
                      width: 230,
                      child: DropdownButton<String>(
                          hint: Text(
                            'Choose class',
                            style: TextStyle(
                              color: HexColor('#265784'),
                            ),
                          ),
                          isExpanded: true,
                          value: classsChoose,
                          //icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: TextStyle(color: HexColor('#265784')),
                          underline: Container(
                            height: 2,
                            color: HexColor('#265784'),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              classsChoose = newValue!;
                            });
                          },
                          items: getList(classes)),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 0, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () async {
                                const url =
                                    // use localhost:
                                    'http://127.0.0.1:5000/api/takeattendance';

                                var body = {
                                  "classname": classsChoose,
                                  "subjectname": subChoose,
                                  "time":1
                                };
                                var data = await fetchData(
                                    url, body, 'POST');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.calendarAlt,
                                      color: Color(0xFFEA734D),
                                      size: 60,
                                    ),
                                  ),
                                  Text(
                                    'Take\nAttendance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEA734D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 20, 20, 0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () async {
                                const url =
                                    'http://192.168.1.41:5000/api/getattendancelist';
                                var body = {
                                  "classname": classsChoose,
                                  "subjectname": subChoose
                                };
                                var data = await fetchData(url, body, 'GET');

                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AttendanceListWidget(),
                                    // AttendanceListWidget(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Align(
                                    alignment: AlignmentDirectional(-0.05, 0),
                                    child: FaIcon(
                                      FontAwesomeIcons.eye,
                                      color: Color(0xFFEA734D),
                                      size: 60,
                                    ),
                                  ),
                                  Text(
                                    'View\nAttendance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEA734D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 0, 20),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.add_circle,
                                  color: Color(0xFFEA734D),
                                  size: 60,
                                ),
                                Text(
                                  'Add/Train\nStudents',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFEA734D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 0, 20, 20),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentInfoWidget(),
                                    //StudentInfoWidget(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.contact_page_sharp,
                                    color: Color(0xFFEA734D),
                                    size: 60,
                                  ),
                                  Text(
                                    'Student\nInfo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEA734D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
