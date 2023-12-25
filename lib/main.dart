import 'package:flutter/material.dart';
import 'package:question_answer/constants.dart';
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
  List<Question> questions = [];
  List<Widget> icons = [];
  int questionCounter = 0;
  int questionLenght = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    icons = [];
    questions = [
      Question(0, "Titanic gelmiş geçmiş en büyük gemidir.", false),
      Question(1, "Dünyadaki tavuk sayısı insan sayısından fazladır.", true),
      Question(2, "Kelebeklerin ömrü bir gündür.", false),
      Question(3, "Dünya düzdür.", false),
      Question(4, "Kaju fıstığı aslında bir meyvenin sapıdır.", true),
      Question(5, "Fatih Sultan Mehmet hiç patates yememiştir.", true),
    ];
    questionLenght = questions.length;
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
          child: Center(child: Text(questions[questionCounter].question ?? "")),
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
                            if (questions[questionCounter].isTrue == false) {
                              if (questionCounter < questionLenght-1) {
                                questionCounter++;
                                icons.add(iconMood);

                              }
                            } else {
                              if (questionCounter < questionLenght-1 ) {
                                questionCounter++;
                                icons.add(iconBadMood);
                                
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
                            if (questions[questionCounter].isTrue == true) {
                              if (questionCounter < questionLenght-1 ) {
                                questionCounter++;
                                icons.add(iconMood);
                                
                              }
                            } else {
                              if (questionCounter < questionLenght-1) {
                                questionCounter++;
                                icons.add(iconBadMood);
                                
                              }
                            }
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
