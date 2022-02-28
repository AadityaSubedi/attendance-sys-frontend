import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class Subjects extends StatefulWidget {
  final  callbackfn;
  const Subjects({Key? key, @required this.callbackfn}) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<List<TextEditingController>> _controllers = [];
  List<Widget> _fields = [];

  void dispose() {
    for (final controller in _controllers) {
      controller[0].dispose();
      controller[1].dispose();
    }
    super.dispose();
  }

  Widget _textFormField(controller, controller2) {
    return Column(children: [
      Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(35, 35, 35, 0),
          child: TextFormField(
            onChanged: (text) => EasyDebounce.debounce(
              'subjectController${_fields.length}',
              const Duration(milliseconds: 2000),
              () => {},
            ),
            controller: controller,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Subject${_fields.length}',
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
                Icons.subject,
                color: Color(0xFF265784),
              ),
              suffixIcon: controller.text.isNotEmpty
                  ? InkWell(
                      onTap: () => controller.clear(),
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
          padding: const EdgeInsetsDirectional.fromSTEB(35, 25, 35, 0),
          child: TextFormField(
            onChanged: (_) => EasyDebounce.debounce(
              'controller2',
              const Duration(milliseconds: 2000),
              () => setState(() {}),
            ),
            controller: controller2,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Classes for Subject${_fields.length}',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: const Color(0x3F265784),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: const Color(0x3F265784),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: const Color(0xFF265784),
              ),
              suffixIcon: controller2.text.isNotEmpty
                  ? InkWell(
                      onTap: () => setState(
                        () => controller2.clear(),
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
            keyboardType: TextInputType.multiline,
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
    ]);
  }

  Widget _addTile() {
    return Align(
      alignment: AlignmentDirectional(-0.75, 0),
      child: IconButton(
          icon: const Icon(
            Icons.add_circle_outline,
            color: Color(0xFFEA734D),
            size: 30,
          ),
          iconSize: 10,
          color: Colors.white,
          onPressed: () {
            final controller = TextEditingController();
            final controller2 = TextEditingController();
            final field = _textFormField(controller, controller2);
            widget.callbackfn!([controller, controller2]);
            setState(() {

              _controllers.add([controller, controller2]);
              _fields.add(field);
            });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_fields.isEmpty) {
      final controller = TextEditingController();
      final controller2 = TextEditingController();
      widget.callbackfn([controller, controller2]);
      setState(() {

        _controllers.add([controller]);
        _fields.add(_textFormField(controller, controller2));
      });
    }
    0;
    return Column(
      children: [
        ..._fields,
        _addTile(),
      ],
    );
  }
}
