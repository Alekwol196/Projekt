// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_final_fields

// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pazig_project/flashcard.dart';
import 'package:pazig_project/flashcard_view.dart';
import 'flashcard.dart';

class FlashCardsMain extends StatefulWidget {
  const FlashCardsMain({Key? key}) : super(key: key);

  @override
  State<FlashCardsMain> createState() => _FlashCardsMainState();
}

class _FlashCardsMainState extends State<FlashCardsMain> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "Do you have any free tables?",
        answer: "	Czy mają państwo wolne stoliki?"),
    Flashcard(
        question: "A table for one/two/three..., please. ",
        answer: "Stlika dla jednej osoby/dla dwojga/trojga... proszę."),
    Flashcard(
        question: "I'd like to make a reservation.",
        answer: "Chciałbym dokonać rezerwacji."),
    Flashcard(question: "I've got a reservation.", answer: "	Mam rezerwację."),
    Flashcard(
        question: "Excuse me!",
        answer: "Przepraszam!- zwrócenie uwagi kelnera"),
    Flashcard(
        question: "Could I see the menu, please? ",
        answer: "Czy mógłby prosić o menu"),
    Flashcard(
        question: "Could I see the wine list, please? ",
        answer: "	Czy mógłby prosić o kartę win?"),
    Flashcard(
        question: "What do you recommend?.", answer: "Co pan/pani poleca?"),
    Flashcard(
        question: "What's the soup/the dish of the day? ",
        answer: "	Jaka jest zupa/danie dnia? "),
    Flashcard(
        question: "I'm a vegetarian/vegan/... ",
        answer: "	Jestem wegetarianinem/weganinem/..."),
    Flashcard(
        question: "A half portion, please.", answer: "Pół porcji, proszę."),
    Flashcard(
        question: "Can I pay by card? ", answer: "	Czy mogę zapłacić kartą?"),
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
