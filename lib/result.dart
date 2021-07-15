import 'dart:math';

import 'package:bmi_calculator/saveResult.dart';
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
  double result;
  String comment;
  String condition;
  @override
  void initState() {
    super.initState();
    result = (widget.weight / (widget.height * widget.height)) * 10000;
    if (result < 18.5) {
      comment = "Need to be a gainer";
      condition = "Under Weight";
    } else if (result >= 18.5 && result <= 24.9) {
      comment = "Fit as a fiddle";
      condition = "Normal";
    } else if (result >= 25 && result <= 29.9) {
      comment = "Loosen up a bit";
      condition = "Over Weight";
    } else if (result >= 30) {
      comment = "Consider a serious workout regime";
      condition = "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 8,
        title: Center(
          child: Text(
            'RESULT',
          ),
        ),
      ),
      // backgroundColor: Color(0xffA77CE4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.07),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        condition,
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: condition == "Normal"
                                ? Colors.green
                                : condition == "Under Weight"
                                    ? Colors.orangeAccent
                                    : condition == "Over Weight"
                                        ? Colors.orange
                                        : Colors.deepOrange),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Text(
                        result.toStringAsFixed(0),
                        style: GoogleFonts.lato(
                            fontSize: 70, fontWeight: FontWeight.w600),
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Column(
                        children: [
                          Text(
                            'Normal BMI Range:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '18 - 25',
                            style: GoogleFonts.lato(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Text(
                        comment.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(builder: (context)=> SavedResult(
                      //        savedResult: result,
                      //        savedCondition : condition
                      //       ))
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 15, horizontal: 18),
                      //     decoration: BoxDecoration(
                      //         color: Color(0xff0A0D22),
                      //         borderRadius: BorderRadius.circular(12)),
                      //     child: Text(
                      //       'SAVE RESULT',
                      //       style: GoogleFonts.lato(
                      //            fontSize: 18,
                      //            fontWeight: FontWeight.w600,
                      //           letterSpacing: 1,
                      //            wordSpacing: 1),
                      //     ),
                      //   ),
                      //  ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Homepage()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: mainColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "CALCULATE AGAIN",
                      style: a.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
