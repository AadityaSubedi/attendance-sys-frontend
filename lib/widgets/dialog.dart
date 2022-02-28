import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

void showErrorDialog(String message, context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title:const Text('An Error Occurred!',
            style: TextStyle(color: Colors.red,
            ),),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child:const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
    );
  }