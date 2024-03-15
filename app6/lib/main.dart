import 'package:flutter/material.dart';
import 'Questions.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appbrain = AppBrain(); //abstraction video 40
void main() {
  runApp(page());
}

class page extends StatelessWidget {
  //const page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.brown[500],
            title: Text(
              "Test",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "NEWS706 BT BOLD"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: page2(),
          ),
        ));
  }
}

class page2 extends StatefulWidget {
  //const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  // get newlist => null;
  List<Widget> answeresault = [];
  int rightanswer = 0; //to count right answer
  void checkedanswer(bool whatuserpicked) {
    //  bool correctanswer = questiongroup[questionnumber].questionanswer;
    // bool correctanswer = appbrain.questiongroup[questionnumber].questionanswer;
    bool correctanswer = appbrain.getquestionanswer();
    setState(() {
      if (whatuserpicked == correctanswer) {
        rightanswer++;
        print("Rigth Answer"); //print in console
        //  print(questiongroup[questionnumber].questiontext);
        print(appbrain.getquestiontext());
        answeresault.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(Icons.thumb_up, color: Colors.green),
        ));
      } else {
        print("Wrong Answer");
        //  print(questiongroup[questionnumber].questiontext);
        print(appbrain.getquestiontext());
        answeresault.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.thumb_up, color: Colors.red),
        ));
      }

      //    appbrain.nextquestion();
    });
    if (appbrain.isfinished() == true) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Test Finished",
        desc: " you are answered $rightanswer questions from 6 .",
        buttons: [
          DialogButton(
            child: Text(
              "restart",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "NEWS706 BT BOLD"),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      appbrain.reset();
      answeresault = [];
      rightanswer = 0;
    } else {
      return appbrain.nextquestion();
    }
  }

  /*
  List<String> questions = [
    'The number of planets in the solar system is 8 planets',
    'Cats are carnivores',
    'China is located in the African continent',
    'The Earth is flat, not spherical'
  ];
  List<String> imagequestion = [
    'images/pic1.png',
    'images/pic2.jpeg',
    'images/pic3.jpeg',
    'images/pic4.jpg'
  ];
  List<bool> answers = [true, true, false, false];
  */
  /*
  List<Questionn> questiongroup = [
    Questionn(
        t: "The number of planets in the solar system is 8 planets",
        i: 'images/pic1.png',
        a: true),
    Questionn(t: 'Cats are carnivores', i: 'images/pic2.jpeg', a: true),
    Questionn(
        t: 'China is located in the African continent',
        i: 'images/pic3.jpeg',
        a: false),
    Questionn(
        t: 'The Earth is flat, not spherical', i: 'images/pic4.jpg', a: false),
         Questionn(
        t: 'Animals do not feel pain',
        i: 'images/pic5.jpeg',
        a: false),
         Questionn(
        t: 'Cairo is the capital of Egypt',
        i: 'images/pic6.jpeg',
        a: true),
  ];
  */

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answeresault,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //  Image(image:
                // image: AssetImage("images/pic1.png")),
                // Image.asset(questiongroup[questionnumber].questionimage),
                Image.asset(
                    // appbrain.questiongroup[questionnumber].questionimage),
                    appbrain.getquestionimage()),

                SizedBox(
                  height: 20,
                ),
                Text(
                  //  "The number of planets in the solar system is 8",
                  // questiongroup[questionnumber].questiontext,
                  //  appbrain.questiongroup[questionnumber].questiontext,
                  appbrain.getquestiontext(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            onPressed: () {
              checkedanswer(true);
            },
            child: Text("Right"),
          ),
        )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Expanded(
                child: ElevatedButton(
              onPressed: () {
                checkedanswer(false);
              },
              child: Text("Wrong"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            )),
          ),
        ),
      ],
    );
  }
}
