import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String title = "Example 1";

  Widget sizedBox = SizedBox(
    height: 24,
  );

  Widget buttons = Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
            onPressed: () {},
            color: Colors.black12,
            child: Text(
              "BUTTON",
              style: TextStyle(fontSize: 16),
            ),
          ),
          FlatButton(
            onPressed: () {},
            color: Colors.black12,
            child: Text(
              "BUTTON",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
            onPressed: () {},
            color: Colors.black12,
            child: Text(
              "BUTTON",
              style: TextStyle(fontSize: 16),
            ),
          ),
          FlatButton(
            onPressed: () {},
            color: Colors.black12,
            child: Text(
              "BUTTON",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    ],
  );

  Widget chart = Container(
    alignment: Alignment.center,
    child: Image(
      image: AssetImage('images/chart.png'),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: ThemeData(
        accentColor: Colors.grey,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(
          children: [
            this.chart,
            this.sizedBox,
            this.buttons,
            this.sizedBox,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text("Email"),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 200,
                  child: TextField(
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    cursorColor: Colors.red,

                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
