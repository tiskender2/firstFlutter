import 'package:flutter/material.dart';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;

  bool isEnabled = true; // for buttons

  Timer _timer;
  int _start = 10;
  Timer answerTimer;
  int startWait = 1;

  int livesCount = 5;

  List<Color> colors = [Colors.white, Colors.white, Colors.white, Colors.white];

  List<Color> buttonColors = [
    Colors.black,
    Colors.black,
  ];

  List<Color> answerColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<IconData> icons = [Icons.thumb_down_off_alt, Icons.thumb_up_off_alt];

  Container answerButton(String title, int index) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 16),
      child: RaisedButton(
        onPressed: isEnabled ? () => didTappedAnswerButton(index) : () => () {},
        textColor: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
              color: answerColor[index],
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          width: double.infinity,
        ),
      ),
    );
  }

  void didTappedCheckBox(int id) {
    setDetaultColor();
    setState(() {
      if (id == 0) {
        answer2 = false;
        answer3 = false;
        answer4 = false;
        colors[0] = Colors.green[300];
      } else if (id == 1) {
        answer1 = false;
        answer3 = false;
        answer4 = false;
        colors[1] = Colors.green[300];
      } else if (id == 2) {
        answer1 = false;
        answer2 = false;
        answer4 = false;
        colors[2] = Colors.green[300];
      } else if (id == 3) {
        answer1 = false;
        answer2 = false;
        answer3 = false;
        colors[3] = Colors.green[300];
      }
    });
  }

  void setDetaultColor() {
    for (var i = 0; i < colors.length; i++) {
      colors[i] = Colors.lightBlue[50];
    }
  }

  void didTappedDisLikeIcon(int id) {
    setState(() {
      icons[0] = Icons.thumb_down_alt;
      buttonColors[0] = Colors.pink;
      icons[1] = Icons.thumb_up_off_alt;
      buttonColors[1] = Colors.black;
    });
  }

  void didTappedLikeIcon(int id) {
    setState(() {
      icons[0] = Icons.thumb_down_off_alt;
      buttonColors[0] = Colors.black;
      icons[1] = Icons.thumb_up_alt;
      buttonColors[1] = Colors.green;
    });
  }

  void didTappedAnswerButton(int index) {
    isEnabled = false;
    startAnswerTimer(index);
    setState(() {
      for (var i = 0; i < answerColor.length; i++) {
        answerColor[i] = Colors.white;
      }
      answerColor[index] = Colors.yellow[300];
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            print("Done");
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void startAnswerTimer(int index) {
    const oneSec = const Duration(seconds: 1);
    answerTimer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startWait == 0) {
          setState(() {
            timer.cancel();
            print("Done");
            // livesCount--;
            answerColor[index] = Colors.green;
          });
        } else {
          setState(() {
            startWait--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Gamer Test"),
        actions: [
          Container(
            child: Row(
              children: [
                Text(
                  "$livesCount",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 16.0),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 48),
              children: [
                Container(
                  //  color: Colors.red,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          // color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "1/10",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      //),
                      Container(
                        height: 80,
                        width: 60,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          // color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  //border: Border.all(
                                  //  color: Colors.blueAccent, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        icons[0],
                                        size: 40,
                                        color: buttonColors[0],
                                      ),
                                      onPressed: () {
                                        didTappedDisLikeIcon(0);
                                      },
                                    ),
                                    Text(
                                      "0",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))),
                      ),
                      Container(
                        height: 80,
                        width: 64,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          // color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "$_start",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red[300],
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      Container(
                        height: 80,
                        width: 60,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          // color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4.0, right: 6.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.red,

                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        icons[1],
                                        size: 40,
                                        color: buttonColors[1],
                                      ),
                                      onPressed: () {
                                        didTappedLikeIcon(0);
                                      },
                                    ),
                                    Text(
                                      "2",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))),
                      ),
                      Container(
                        height: 80,
                        width: 90,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          // color: colors[0],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "LEAGUE OF LEGENS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Why is there a cake in the middle of Caitlyn's traps?",
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                answerButton("Answer A", 0),
                answerButton("Answer B", 1),
                answerButton("Answer C", 2),
                answerButton("Answer D", 3)
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
