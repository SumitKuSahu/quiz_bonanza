import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

Quizbrain quizbrain = Quizbrain();
void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Quiz()),
    ),
  ));
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];

  void checkanswers(bool useranswer) {
    setState(() {
      // ignore: unrelated_type_equality_checks
      if (quizbrain.isfinish() == true) {
        Alert(context: context, title: "Finish!", desc: "Excellent Try")
            .show();
        quizbrain.reset();
        score = [];
      } else {
        if (quizbrain.quizans() == useranswer) {
          score.add(Icon(
            Icons.add_location_outlined,
            color: Colors.green,
          ));
        } else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        quizbrain.quesno();
      }
    });
  }
  // List<String> questions=['You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'];
// ignore: non_constant_identifier_names
//   int question_number = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizbrain.quizques(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  )),
            ),
          ),
          flex: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                child: Text("False",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                color: Colors.red,
                onPressed: () {
                  checkanswers(false);
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                child: Text(
                  "True",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  checkanswers(true);
                }),
          ),
        ),
        Row(children: score),
      ],
    );
  }
}

/**/
