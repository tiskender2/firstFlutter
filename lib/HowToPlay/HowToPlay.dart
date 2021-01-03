import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Gamer Test"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding:
                  EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 48),
              children: [
                Container(
                  child: Text(
                    "How to play?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(
                    "You can start the play by clicking the game that you want to play. There are 4 difficult levels for each game. Depending on the level in (15,12,8,6) seconds you have to answer the question. If you complete the test you will achieve points.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    "How to send question?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(
                    "You can send a question tapping on the send a question button.You should type your question and 4 answers that one of them is true.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    "How to get more lives?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(
                    "Each player has 5 lives to play. Every wrong answer take 1 lives. There are 2 ways to get more lives, these; \n\n- Wait 30 minutes to get 1 lives.\n- Watch ad to get 1 lives.\n\nNote, If you already have 5 out of 5 lives you can not get more lives even though you are watching ad or waiting for 30 minutes",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 120,
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(bottom: 44),
              height: 30,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
