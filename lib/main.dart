import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  String inputValue = "";
  String calculatedValue = "";

  String operator = "";

  @override
  Widget build(BuildContext context) {
    // Calculate size inside the build method
    double size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputValue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),
            Column(
              children: [
                // First Row - 7,8,9

                Row(
                  children: [
                    calcButton(
                        size, "7", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "8", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "9", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "/", Colors.orange), // Pass size as a parameter
                  ],
                ),

                Row(
                  children: [
                    calcButton(
                        size, "4", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "5", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "6", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "*", Colors.orange), // Pass size as a parameter
                  ],
                ),

                Row(
                  children: [
                    calcButton(
                        size, "1", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "2", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "3", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "-", Colors.orange), // Pass size as a parameter
                  ],
                ),

                Row(
                  children: [
                    calcButton(
                        size, "0", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, ".", Colors.white38), // Pass size as a parameter
                    calcButton(
                        size, "=", Colors.orange), // Pass size as a parameter
                    calcButton(
                        size, "+", Colors.orange), // Pass size as a parameter
                  ],
                )
              ],
            ),
            calcButton(size, "Clear", Colors.black)
          ],
        ),
      ),
    );
  }

  // Updated calcButton to accept size as a parameter
  Widget calcButton(double size, String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
            calculatedValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "/" || text == "*") {
          setState(() {
            calculatedValue = inputValue;
            inputValue = "";

            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatedValue);
            double input = double.parse(inputValue);

            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: const EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
