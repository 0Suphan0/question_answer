import 'package:flutter/material.dart';
import 'package:question_answer/constants.dart';
import 'package:question_answer/question_operation.dart';
import 'package:question_answer/question.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  QuestionOperation questionOperation = QuestionOperation();

  List<Widget> icons = [];
  int questionLenght = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    icons = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Bilgi Testi Soruları',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
              child: Text(
            questionOperation.getQuestion() ?? "",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        Expanded(
            flex: 1,
            child: Wrap(
              children: icons,
              spacing: 3,
              runSpacing: 3,
            )),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Arkaplan rengi
                          ),
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                            color: Colors.white, // Icon rengi
                          ),
                          onPressed: () {
                            setState(() {});
                            if (questionOperation.getTrueFalse() == false) {
                              if (questionOperation.isQuestionEnd() == true) {
                                //alert.
                                _showMyDialog();
                                print("alert");
                              } else {
                                icons.add(iconMood);
                                questionOperation.incCounter();
                              }
                            } else {
                              if (questionOperation.isQuestionEnd() == true) {
                                //alert.
                                _showMyDialog();
                                print("alert");
                              } else {
                                icons.add(iconBadMood);
                                questionOperation.incCounter();
                              }
                            }
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Arkaplan rengi
                          ),
                          child: const Icon(
                            Icons.thumb_up,
                            size: 30.0,
                            color: Colors.white, // Icon rengi
                          ),
                          onPressed: () {
                            setState(() {});
                            if (questionOperation.getTrueFalse() == true) {
                              if (questionOperation.isQuestionEnd() == true) {
                                //alert.
                                _showMyDialog();
                                print("alert");
                              } else {
                                icons.add(iconMood);
                                questionOperation.incCounter();
                              }
                            } else {
                              if (questionOperation.isQuestionEnd() == true) {
                                //alert.
                                _showMyDialog();
                                print("alert");
                              } else {
                                icons.add(iconBadMood);
                                questionOperation.incCounter();
                              }
                            }
                          },
                        ))),
              ])),
        )
      ],
    );
  }
Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Sorular Tamamlandı!'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Sorular Tamamlandı'),
              Text('Baştan başlamak ister misiniz ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Evet'),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                
              });
              questionOperation.restartGame();
              icons.clear();

            },
          ),
        ],
      );
    },
  );
}

}

