import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class SendQuestion extends StatefulWidget {
  @override
  SendQuestionState createState() => SendQuestionState();
}

class SendQuestionState extends State<SendQuestion> {
  bool answer1 = false;
  bool answer2 = false;
  bool answer3 = false;
  bool answer4 = false;

  var selectedUsState = "Choose Game";

  List<String> usStates = <String>[
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
  ];

  List<Color> colors = [
    Colors.lightBlue[50],
    Colors.lightBlue[50],
    Colors.lightBlue[50],
    Colors.lightBlue[50]
  ];

  TextField text1 = TextField(
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        // border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: 'Answer A'),
  );
  TextField text2 = TextField(
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        // border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: 'Answer B'),
  );
  TextField text3 = TextField(
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        // border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: 'Answer C'),
  );
  TextField text4 = TextField(
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        // border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: 'Answer D'),
  );

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

  void didTappedChooseGame() {
    showMaterialScrollPicker(
      headerColor: Colors.lightBlue,
      showDivider: false,
      context: context,
      title: "Choose Your Game",
      items: usStates,
      selectedItem: selectedUsState,
      onChanged: (value) => setState(() => selectedUsState = value),
    );
  }

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
                  EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 48),
              children: [
                Container(
                  child: Text(
                    "Your Question:",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: TextFormField(
                    minLines: 5,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: 'Type question here',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    "Answers:",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: answer1,
                          activeColor: Colors.green,
                          onChanged: (bool val) {
                            answer1 = val;
                            didTappedCheckBox(0);
                          }),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: colors[0],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: text1),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: answer2,
                          activeColor: Colors.green,
                          onChanged: (bool val) {
                            answer2 = val;
                            didTappedCheckBox(1);
                          }),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: colors[1],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: text2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: answer3,
                          activeColor: Colors.green,
                          onChanged: (bool val) {
                            answer3 = val;
                            didTappedCheckBox(2);
                          }),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: colors[2],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: text3),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: answer4,
                          activeColor: Colors.green,
                          onChanged: (bool val) {
                            answer4 = val;
                            didTappedCheckBox(3);
                          }),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: colors[3],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: text4),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 0, bottom: 0, top: 16),
                  child: FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      didTappedChooseGame();
                    },
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1)),
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "$selectedUsState",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 20,
                          )
                        ],
                      ),
                      width: double.infinity,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 0, bottom: 0, top: 16),
                  child: RaisedButton(
                    onPressed: () {
                      //didTappedLoginButton();
                    },
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        'Send Question',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      width: double.infinity,
                    ),
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
