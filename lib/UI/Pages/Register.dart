//import 'package:attendancesys_flutter/UI/DashBoard/LogIn.dart';
// import 'package:attendancesys_flutter/UI/Pages/Dashboard.dart';
// ignore_for_file: prefer_const_constructors, unnecessary_const, prefer_const_literals_to_create_immutables

import 'package:attendance_sys/UI/Pages/Dashboard.dart';
import 'package:attendance_sys/UI/Pages/LogIn.dart';
import 'package:attendance_sys/main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late bool passwordVisibility1;
  late TextEditingController textController4;
  late bool passwordVisibility2;
  late TextEditingController textController5;
  late TextEditingController textController6;
  late TextEditingController textController7;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    passwordVisibility1 = false;
    textController4 = TextEditingController();
    passwordVisibility2 = false;
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
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
            flexibleSpace: Align(
              alignment: const AlignmentDirectional(-0.55, -0.1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                        Align(
                          alignment: const AlignmentDirectional(-0.85, -0.2),
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: AutoSizeText(
                              'Welcome On board!',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: const Color(0xFF265784),
                                labelStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  fontSize: 18,
                                ),
                                indicatorColor: const Color(0xFFEA734D),
                                indicatorWeight: 3,
                                tabs: [
                                  const Tab(
                                    text: 'Credentials',
                                  ),
                                  const Tab(
                                    text: 'Details',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 1, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(35, 55, 35, 0),
                                              child: TextFormField(
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'textController1',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                controller: textController1,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Username',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons
                                                        .person_outline_rounded,
                                                    color: Color(0xFF265784),
                                                  ),
                                                  suffixIcon: textController1
                                                          .text.isNotEmpty
                                                      ? InkWell(
                                                          onTap: () => setState(
                                                            () =>
                                                                textController1
                                                                    .clear(),
                                                          ),
                                                          child: const Icon(
                                                            Icons.clear,
                                                            color: Color(
                                                                0xFF265784),
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
                                                keyboardType:
                                                    TextInputType.name,
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
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(35, 40, 35, 0),
                                              child: TextFormField(
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'textController2',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                controller: textController2,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Email',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons.email_outlined,
                                                    color: Color(0xFF265784),
                                                  ),
                                                  suffixIcon: textController2
                                                          .text.isNotEmpty
                                                      ? InkWell(
                                                          onTap: () => setState(
                                                            () =>
                                                                textController2
                                                                    .clear(),
                                                          ),
                                                          child: const Icon(
                                                            Icons.clear,
                                                            color: Color(
                                                                0xFF265784),
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
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: (val) {
                                                  if (val!.isEmpty) {
                                                    return 'Email Required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(35, 40, 35, 0),
                                              child: TextFormField(
                                                controller: textController3,
                                                obscureText:
                                                    !passwordVisibility1,
                                                decoration: InputDecoration(
                                                  hintText: 'Password',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: const Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons.lock_outlined,
                                                    color: Color(0xFF265784),
                                                  ),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => passwordVisibility1 =
                                                          !passwordVisibility1,
                                                    ),
                                                    child: Icon(
                                                      passwordVisibility1
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
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
                                                keyboardType: TextInputType
                                                    .visiblePassword,
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
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(35, 40, 35, 0),
                                              child: TextFormField(
                                                controller: textController4,
                                                obscureText:
                                                    !passwordVisibility2,
                                                decoration: InputDecoration(
                                                  hintText: 'Confirm Password',
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: const Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x3F265784),
                                                      width: 3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  prefixIcon: const Icon(
                                                    Icons.lock_outlined,
                                                    color: Color(0xFF265784),
                                                  ),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => passwordVisibility2 =
                                                          !passwordVisibility2,
                                                    ),
                                                    child: Icon(
                                                      passwordVisibility2
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
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
                                                keyboardType: TextInputType
                                                    .visiblePassword,
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Already have an account?',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: HexColor("#7f265784"),
                                                      fontSize: 16,
                                                    ),
                                                ),
                                               TextButton(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                  ),
                                                  onPressed: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LogInWidget(),
                                                      ),
                                                    );
                                                  },
                                                   child: Text(
                                                      'Sign In',
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(35, 20, 35, 0),
                                                child: TextFormField(
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    'textController5',
                                                    const Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  controller: textController5,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Full Name',
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x3F265784),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x3F265784),
                                                        width: 3,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                    prefixIcon: const Icon(
                                                      Icons
                                                          .person_outline_rounded,
                                                      color: Color(0xFF265784),
                                                    ),
                                                    suffixIcon: textController5
                                                            .text.isNotEmpty
                                                        ? InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () =>
                                                                  textController5
                                                                      .clear(),
                                                            ),
                                                            child: const Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF265784),
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
                                                  keyboardType:
                                                      TextInputType.name,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return 'FullName required';
                                                    }

                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    35, 35, 35, 0),
                                            child: TextFormField(
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'textController6',
                                                const Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              controller: textController6,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Subject 1',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x3F265784),
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x3F265784),
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.subject,
                                                  color: Color(0xFF265784),
                                                ),
                                                suffixIcon: textController6
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () => setState(
                                                          () => textController6
                                                              .clear(),
                                                        ),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF265784),
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
                                                  return 'Subject required';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    35, 25, 35, 0),
                                            child: TextFormField(
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'textController7',
                                                const Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              controller: textController7,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Classes for Subject 1',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: const Color(0x3F265784),
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: const Color(0x3F265784),
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                prefixIcon: const Icon(
                                                  Icons.person_outline_rounded,
                                                  color: const Color(0xFF265784),
                                                ),
                                                suffixIcon: textController7
                                                        .text.isNotEmpty
                                                    ? InkWell(
                                                        onTap: () => setState(
                                                          () => textController7
                                                              .clear(),
                                                        ),
                                                        child: const Icon(
                                                          Icons.clear,
                                                          color:
                                                              Color(0xFF265784),
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
                                              keyboardType:
                                                  TextInputType.multiline,
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return 'Classes required';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Note: Add classes seperated by comma',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xAFEA734D),
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Align(
                                          alignment:
                                              AlignmentDirectional(-0.75, 0),
                                          child: Icon(
                                            Icons.add_circle_outline,
                                            color: Color(0xFFEA734D),
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child:ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(120, 50),
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
                                                  duration:
                                                      const Duration(milliseconds: 0),
                                                  reverseDuration:
                                                      const Duration(milliseconds: 0),
                                                  child: const DashboardWidget(), //Text("DashBoard Called") 
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Already have an account?',
                                                style:
                                                    TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: HexColor("#7f265784"),
                                                      fontSize: 16,
                                                    ),
                                              ),
                                             TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                ),
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LogInWidget(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                      'Sign In',
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
