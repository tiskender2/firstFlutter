import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/Home.dart';
import 'package:flutter_demo/Register/Register.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamer Test',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginUI(),
    );
  }
}

class LoginUI extends StatefulWidget {
  @override
  LoginUIState createState() => LoginUIState();
}

class LoginUIState extends State<LoginUI> {
  //TextEditingController delegate = TextEditingController();
  //String emailText = delegate.text;
  String emailText = "";
  String passwordText = "";

  void didTappedLoginButton() {
    //Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  void didTappedSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 64.0),
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
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 32),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    // controller: delegate,
                    onChanged: (text) {
                      emailText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 32),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    onChanged: (text) {
                      passwordText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 32),
                child: RaisedButton(
                  onPressed: () {
                    didTappedLoginButton();
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
                      'Login',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account yet?"),
                    FlatButton(
                        onPressed: () {
                          didTappedSignUpButton();
                        },
                        // color: Colors.blue,
                        textColor: Colors.black,
                        highlightColor: Theme.of(context).backgroundColor,
                        //disabledColor: Colors.red,
                        //disabledTextColor: Colors.black,
                        // splashColor: Colors.blueAccent,
                        //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Text("Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
