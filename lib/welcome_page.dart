// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_import, must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazig_project/flash_cards_main4.dart';
import 'package:pazig_project/auth_controller.dart';
import 'package:pazig_project/flash_cards_main.dart';
import 'package:pazig_project/flash_cards_main2.dart';
import 'package:pazig_project/flash_cards_main3.dart';
// import 'package:pazig_project/notes.dart';
import 'package:pazig_project/signup_page.dart';

import 'notes.dart';

class WelcomePage extends StatelessWidget {
  String email;

  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/loginimg.png"), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: "GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "RESTAURANT SECTION",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(FlashCardsMain())),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: "GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "AIRPORT SECTION",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(FlashCardsMain2())),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: "GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "HOSPITAL SECTION",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(FlashCardsMain3())),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: "GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "HOTEL SECTION",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(FlashCardsMain4())),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: " LET'S GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "NOTES",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(Notes())),
            ],
          )),

          /* SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            text: "GO TO ",
            style: TextStyle(color: Colors.grey[500], fontSize: 20),
            children: [
              TextSpan(
                  text: "NOTES",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(Notes())),
            ],
          )),
          */
          SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.logOut();
            },
            child: Container(
              width: w * 0.3,
              height: h * 0.04,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage("img/button.png"), fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
