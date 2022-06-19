// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_final_fields

// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pazig_project/flashcard.dart';
import 'package:pazig_project/flashcard_view.dart';
import 'flashcard.dart';

class FlashCardsMain3 extends StatefulWidget {
  const FlashCardsMain3({Key? key}) : super(key: key);

  @override
  State<FlashCardsMain3> createState() => _FlashCardsMain3State();
}

class _FlashCardsMain3State extends State<FlashCardsMain3> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "More fiches will appear here. ",
        answer: "Tutaj pojawią się kolejne fiszki. ")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcards[_currentIndex].answer,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('PREV'),
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF758FDB),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('NEXT'),
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF758FDB),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
