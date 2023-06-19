import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const List<Map<String, dynamic>> _questions = [
    {
      "question": "How is Dobby freed from serving the Malfoy's?",
      "answers": ["A Potion", "A Spell", "A Sock", "A Pair of Pants"],
      "correctAns": "A Sock",
    },
    {
      "question": "What position does Harry play on his Quidditch team?",
      "answers": ["Bludger", "Seeker", "Chaser", "Keeper"],
      "correctAns": "Seeker",
    },
    {
      "question": "From which platform at Kings Cross does the Hogwarts Express train depart?",
      "answers": ["Gringotts", "wand", "Nine and three-quarters", "The trolls club"],
      "correctAns": "Nine and three-quarters",
    },
    {
      "question": "What spell did Harry use to kill Lord Voldemort?",
      "answers": ["Expelliarmus", "Expecto Patronum", "Avada Kedavra", "Accio"],
      "correctAns": "Expelliarmus",
    },
    {
      "question": "Which Patronus belongs to Luna Lovegood?",
      "answers": ["Doe", "Hare", "Dove", "Horse"],
      "correctAns": "Hare",
    },
    {
      "question": "“It’s Levi-O-sa, not…”",
      "answers": ["Levi-o-SA", "LEVI-o-sa", "im confusion"],
      "correctAns": "Levi-o-SA",
    },
    {
      "question": "Who is the half-blood prince?",
      "answers": [
        "Tom Riddle",
        "Eileen Prince",
        "Severus Snape",
        "Lucius Malfoy"
      ],
      "correctAns": "Severus Snape",
    },
  ];

  void _answerQuestion(int res) {
    setState(() {
      totalScore += res;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UE208049"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          // child: Row(
          //   children: [
          //     Icon(Icons.refresh),
          //     SizedBox(width: 5),
          //     Text(
          //       "Reset",
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ],
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          onPressed: () {
            _resetQuiz();
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: _questionIndex >= _questions.length
              ? Result(totalScore)
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
