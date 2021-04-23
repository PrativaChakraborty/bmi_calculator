import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/homepage.dart';

class Result extends StatefulWidget {
  final double height, weight;

  const Result({
    Key key,
    this.height,
    this.weight,
  }) : super(key: key);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
    result = (widget.weight / (widget.height * widget.height)) * 10000;
    if (result < 18.5) {
      condition = "Need to be a gainer";
    } else if (result >= 18.5 && result <= 24.9) {
      condition = "Fit as a fiddle";
    } else if (result >= 25 && result <= 29.9) {
      condition = "Loosen up a bit";
    } else if (result >= 30) {
      condition = "Consider a serious workout regime";
    }
  }

  double result;
  String condition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA77CE4),
      body: Center(
        child: Card(
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your BMI",
                  style: GoogleFonts.lato(
                      fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  result.toStringAsFixed(0),
                  style: GoogleFonts.nunito(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  condition.toString(),
                  style: GoogleFonts.dancingScript(
                      fontSize: 25, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Homepage()),
              (Route<dynamic> route) => false);
        },
        elevation: 6,
        child: const Icon(Icons.rotate_left, size: 35),
        backgroundColor: mainColor,
      ),
    );
  }
}
