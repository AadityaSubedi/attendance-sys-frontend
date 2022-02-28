import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:attendance_sys/main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class AddTrainStudentWidget extends StatefulWidget {
  const AddTrainStudentWidget({ Key? key}) : super(key: key);

  @override
  _AddTrainStudentWidgetState createState() => _AddTrainStudentWidgetState();
}

class _AddTrainStudentWidgetState extends State<AddTrainStudentWidget> {
  String uploadedFileUrl = '';
  late TextEditingController textController1;
  late TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
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
                                    builder: (context) => LogInWidget(),
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
          actions: [
            Align(
              alignment: AlignmentDirectional(0, 0.15),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardWidget(),
                    ),
                  );
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
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController1',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Class',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF265784),
                        ),
                        suffixIcon: textController1.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController1.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF265784),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Color(0x7F265784),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(35, 10, 35, 20),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController2',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Roll  No',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x3F265784),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xFF265784),
                        ),
                        suffixIcon: textController2.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => textController2.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF265784),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: GoogleFonts.getFont(
                        'Roboto',
                        color: Color(0x7F265784),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      // ignore: prefer_const_constructors
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://picsum.photos/seed/954/600',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                          hoverColor: Colors.transparent,
                          // Radius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.add_circle,
                            color: Color(0xFFEA734D),
                            size: 60,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardWidget(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: ElevatedButton(
                        
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                              reverseDuration: Duration(milliseconds: 0),
                              child: DashboardWidget(),
                            ),
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardWidget(),
                            ),
                          );
                        },
                         child: const Text(
                            'Upload',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: ElevatedButton(
                        
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                              reverseDuration: Duration(milliseconds: 0),
                              child: DashboardWidget(),
                            ),
                          );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardWidget(),
                            ),
                          );
                        },
                         child: const Text(
                            'Train',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                      ),
                    
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}