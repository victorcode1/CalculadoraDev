import 'package:Calculadora/responsive.dart';
import 'package:Calculadora/widgets/calc_button.dart';
import 'package:Calculadora/widgets/dialog_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: CalcApp()));
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = "";
  String _expression = "";
  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void allClear(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  bool contienePuntoYCaracterCero(String cadena) {
    RegExp regex = RegExp(r'\.0$');
    return regex.hasMatch(cadena);
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      double result = exp.evaluate(EvaluationType.REAL, cm);

      if (!contienePuntoYCaracterCero(result.toString())) {
        _expression = result.toString();
      } else {
        int resultAsInteger = result.toInt();
        _expression = resultAsInteger.toString();
      }
    });
  }

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 24;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        Visibility(
          visible: false,
          child: IconButton(
            padding: const EdgeInsets.only(right: 28),
            icon: const Icon(Icons.add_alert),
            tooltip: 'Información del desarrollador',
            onPressed: () {
              if (Responsive.isTablet(context)) {
                ShowDialog().mostrarDialogo(context);
                return;
              }
              if (Responsive.isPhone(context)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DialogInfo()));
              }
            },
          ),
        ),
      ]),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: Text(
                      _history,
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 24, color: Color(0xFF545F61))),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: (Text(
                      _expression,
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                              fontSize: 48, color: Colors.white)),
                    )),
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CalcButton(
                        bgcolor: 0xFF00BF45,
                        text: "AC",
                        callback: allClear,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        bgcolor: 0xffE3303A,
                        text: "C",
                        callback: clear,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "%",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "/",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CalcButton(
                        text: "7",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "8",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "9",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "*",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CalcButton(
                        text: "4",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "5",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    CalcButton(
                      text: "6",
                      callback: numClick,
                      textSize: textSize,
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "-",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CalcButton(
                        text: "1",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "2",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "3",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "+",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CalcButton(
                        text: ".",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "0",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "00",
                        callback: numClick,
                        textSize: textSize,
                      ),
                    ),
                    Flexible(
                      child: CalcButton(
                        text: "=",
                        callback: evaluate,
                        textSize: textSize,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
