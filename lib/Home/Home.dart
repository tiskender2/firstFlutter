import 'package:flutter/material.dart';
import 'package:flutter_demo/Game/Game.dart';
import 'package:flutter_demo/HowToPlay/HowToPlay.dart';
import 'package:flutter_demo/LeftMenu/LeftMenu.dart';
import 'package:flutter_demo/SendQuestion/SendQuestion.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  //TextEditingController delegate = TextEditingController();
  //String emailText = delegate.text;
  String emailText = "";
  String passwordText = "";

  void didTappedLeftMenuButton(GlobalKey<ScaffoldState> key) {
    key.currentState.openDrawer();
  }

  void didTappedPlayButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Game()),
    );
  }

  void didTappedSendQuestionButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SendQuestion()),
    );
  }

  void didTappedHowToPlayButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HowToPlay()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: LeftMenu(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Gamer Test"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              didTappedLeftMenuButton(_scaffoldKey);
            }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 32),
                child: RaisedButton(
                  onPressed: () {
                    didTappedPlayButton();
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.blue[50], width: 2)),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      'PLAY',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
                child: RaisedButton(
                  onPressed: () {
                    didTappedSendQuestionButton();
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 8),
                child: RaisedButton(
                  onPressed: () {
                    didTappedHowToPlayButton();
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
                      'How to Play?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
