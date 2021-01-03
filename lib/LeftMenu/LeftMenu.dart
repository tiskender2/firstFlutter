import 'package:flutter/material.dart';

class LeftMenu extends StatefulWidget {
  @override
  LeftMenuState createState() => LeftMenuState();
}

class LeftMenuState extends State<LeftMenu> {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: MediaQuery.of(context).size.width * 0.85, //20.0,
      child: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 52.0, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterLogo(
                      size: 100,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Tolga İskender",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[50]),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "appgames@gmail.com",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue[100]),
                    )
                  ],
                ),
              ),
            ),
            Container(
              //color: Colors.red,
              padding: EdgeInsets.only(top: 8, bottom: 0),
              width: double.infinity,
              //height: 50,
              child: Text(
                "Games",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 0.0, bottom: 32),
                itemCount: 25,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 1,
                  thickness: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('item $index'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
