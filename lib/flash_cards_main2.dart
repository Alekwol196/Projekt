// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, duplicate_ignore, prefer_const_literals_to_create_immutables, prefer_final_fields

// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pazig_project/flashcard.dart';
import 'package:pazig_project/flashcard_view.dart';
import 'flashcard.dart';

class FlashCardsMain2 extends StatefulWidget {
  const FlashCardsMain2({Key? key}) : super(key: key);

  @override
  State<FlashCardsMain2> createState() => _FlashCardsMain2State();
}

class _FlashCardsMain2State extends State<FlashCardsMain2> {
  List<Flashcard> _flashcards = [
    Flashcard(
        question: "Do you want a one-way ticket or a round-trip ticket?",
        answer:
            "	Czy chciałby/łaby Pan/i bilet w jedną stronę czy bilet w dwie strony?"),
    Flashcard(
        question: "I booked the ticket online. ",
        answer: "Zarezerwowałem/am bilet na internecie."),
    Flashcard(
        question: "I'd like to book a ticket to New York.",
        answer: "Chciałbym/łabym zarezerwować bilet do Nowego Jorku."),
    Flashcard(
        question: "Is the ticket refundable?",
        answer: " Czy bilet można zwrócić?"),
    Flashcard(
        question: "Is this a low-cost carrier?",
        answer: "Czy to tania linia lotnicza?"),
    Flashcard(
        question: "How long does the flight take?",
        answer: "Jak długo potrwa lot?"),
    Flashcard(
        question: "How much is a round-trip ticket?",
        answer: "	Ile kosztuje bilet w obie strony?"),
    Flashcard(
        question: "What’s your booking reference?",
        answer: "Jaki ma Pan/i numer rezerwacji?"),
    Flashcard(
        question: "Which airline should I fly with?",
        answer: "	Którymi liniami powinienem/powinnam podróżować?"),
    Flashcard(
        question: "Do I need a visa to travel to the USA? ",
        answer: "Czy potrzebuję wizy, aby wyjechać do USA?"),
    Flashcard(
        question: "The shuttle bus departs every 4 minutes.",
        answer: "Autobus wahadłowy kursuje co 4 minuty."),
    Flashcard(
        question: "Where is the LOT check-in desk?",
        answer: "Gdzie jest stanowisko odpraw LOTu?"),
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
