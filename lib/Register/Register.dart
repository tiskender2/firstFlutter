import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  //TextEditingController delegate = TextEditingController();
  //String emailText = delegate.text;
  String emailText = "";
  String passwordText = "";
  String rePasswordText = "";
  String nameText = "";

  void didTappedRegisterButton() {
    print("didTappedRegisterButton");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Register"),
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
                    decoration: InputDecoration(labelText: 'Full Name'),
                    // controller: delegate,
                    onChanged: (text) {
                      nameText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (text) {
                      emailText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    onChanged: (text) {
                      passwordText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    onChanged: (text) {
                      rePasswordText = text;
                      // print("First text field: $emailText");
                    },
                  )),
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 24),
                child: RaisedButton(
                  onPressed: () {
                    didTappedRegisterButton();
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
                      'Register',
                      style: TextStyle(fontSize: 20),
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
