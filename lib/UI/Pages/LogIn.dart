
import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/Register.dart';
import 'package:attendance_sys/main.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
          child: AppBar(
            backgroundColor: const Color(0xFF265784),
            automaticallyImplyLeading: false,
            flexibleSpace: const Align(
              alignment: AlignmentDirectional(-0.55, -0.1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'Smart \nAttendance',
                  style:TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            actions: [
              Align(
                alignment: const AlignmentDirectional(0.1, 0.15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/2123.png',
                    
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.4,
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
              padding: const EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
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
                              // ignore: prefer_const_constructors
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(0),
                                bottomRight: const Radius.circular(0),
                                topLeft: const Radius.circular(100),
                                topRight: const Radius.circular(0),
                              ),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.85, -0.2),
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: AutoSizeText(
                              'Welcome Back!',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -0.5),
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/Wavy_Tech-17_Single-03.jpg',
                                width: 250,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(35, 20, 35, 0),
                      child: TextFormField(
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController1',
                          const Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x3F265784),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x3F265784),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_outline_rounded,
                            color: Color(0xFF265784),
                          ),
                          suffixIcon: textController1.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController1.clear(),
                                  ),
                                  child: const Icon(
                                    Icons.clear,
                                    color: Color(0xFF265784),
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: const Color(0x7F265784),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Username required';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(35, 20, 35, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x3F265784),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x3F265784),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outlined,
                            color: Color(0xFF265784),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF265784),
                              size: 22,
                            ),
                          ),
                        ),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: const Color(0x7F265784),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Password Required';
                          }
                          if (val.length < 6) {
                            return 'Password must be at least 6 character long';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child:ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 50),
                        primary: colorSecondary,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
               ),
                        ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 0),
                            reverseDuration: const Duration(milliseconds: 0),
                            child: const DashboardWidget(),//Text("DashBoard Called")
                          ),
                        );
                      },
                      child: const Text('LogIn',
                      style: TextStyle(
                        fontSize: 18,
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: HexColor("#7f265784"),
                            fontSize: 16,
                          ),
                        ),
                       TextButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterWidget(),
                              ),
                            );
                          },
                          child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: colorSecondary,
                            fontSize: 16,
                          ),
                        ),
                       ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
