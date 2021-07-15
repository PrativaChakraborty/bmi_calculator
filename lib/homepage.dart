import 'package:bmi_calculator/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isMale = false;
  double height = 150;
  int age = 16;
  int weight = 30;
  int bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Age_card
                  buildInputCard("Age(in years)", age, true),

                  //Weight_card
                  buildInputCard("Weight(in kg)", weight, false),
                ],
              ),
            ),
          ),

          //Height_card
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                color: cardColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Height",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                // color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toInt().toString(),
                            style: GoogleFonts.mukta(
                              textStyle: TextStyle(
                                  // color: textColor,
                                  fontSize: 45,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            ' cm',
                            style: GoogleFonts.lato(
                                // color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Slider(
                          min: 100,
                          max: 300,
                          divisions: 200,
                          value: height,
                          activeColor: mainColor,
                          inactiveColor: lightColor,
                          onChanged: (h) {
                            setState(() {
                              height = h;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Gender_card
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 5,
                color: cardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Gender",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              // color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              "I'm",
                              style: GoogleFonts.mukta(
                                textStyle: TextStyle(
                                    // color: textColor,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Text(
                            "Female",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  //color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          CupertinoSwitch(
                              value: isMale,
                              onChanged: (b) {
                                setState(() {
                                  isMale = b;
                                });
                              },
                              activeColor: mainColor, //lightColor,
                              trackColor: mainColor),
                          Text(
                            "Male",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  //color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Calculate button
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Result(
                    height: height,
                    weight: weight.toDouble(),
                  ),
                ),
              );
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
                    "CALCULATE",
                    style: a.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded buildInputCard(String title, int value, bool isAge) {
    // print("value 1st : $value");
    return Expanded(
      child: Card(
        color: cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      // color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                value.toString(),
                style: GoogleFonts.mukta(
                  textStyle: TextStyle(
                      // color: textColor,
                      fontSize: 60,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isAge)
                        age--;
                      else
                        weight--;

                      // print("value 2nd : $value");
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isAge)
                        age++;
                      else
                        weight++;
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 40, //color: mainColor
                          ),
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
    );
  }
}

TextStyle a = TextStyle(
    letterSpacing: 1.5,
    // color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16);
Color mainColor = Color(0xff673AB7);
Color textColor = Colors.black54;
Color lightColor = Color(0xffFBEAFF);
Color cardColor = Color(0xff1D1F33);
