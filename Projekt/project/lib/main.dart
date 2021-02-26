import 'package:custom_password_validator/helpers/easy_password_validator.dart';
import 'package:custom_password_validator/password_strength_meter.dart';
import 'package:flutter/material.dart';

import 'package:multi_wizard/multi_wizard.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDDC73 Project',
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
      home: MyHomePage(title: 'TDDC73 Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  String name = "";
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key2 = GlobalKey<FormState>();
  GlobalKey<FormState> key3 = GlobalKey<FormState>();

  bool canGoNext() {
    if (key3.currentState.validate()) {
      key3.currentState.save();
      return true;
    }
    return false;
  }

  Widget txWizard(BuildContext context) {
    return Form(
      child: MultiWizard(
        decoration: BoxDecoration(color: Colors.white),
        steps: [
          WizardStep(
            nextFunction: canGoNext,
            showPrevious: false,
            child: Column(
              children: [
                Form(
                  key: key3,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "What's your name?"),
                    validator: (t) {
                      if (t.length < 2) return "Must be at least 2 chars long!";
                      return null;
                    },
                    onSaved: (t) {
                      setState(() {
                        name = t;
                      });
                      },
                    autovalidateMode: AutovalidateMode.disabled,
                  ),
                ),
              ],
            ),
          ),
          WizardStep(child: Text("Hello! ${name}")),
        ],
      ),
    );
  }

  void _txModalSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return txWizard(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), label: "Password Strength Meter"),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Wizard"),
        ],
        onTap: (newIndex) {
          setState(
            () {
              index = newIndex;
            },
          );
        },
        elevation: 8,
      ),
      body: index == 0
          ? Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: key,
                      child: PasswordStrengthMeter(

                        key: Key('Password Strength Meter'),
                        strengthMeterDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.disabled,
                        validationAlgorithm: EasyPasswordValidator(),
                      ),
                    ),
                  ),
                  FlatButton(
                    key: Key('validate button'),
                    child: Text("Validate password"),
                    onPressed: () {
                      if (key.currentState.validate()) return null;
                    },
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  child: Text("Demo 1"),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text("Hello $name"),
                            RaisedButton(
                              child: Text("Open Form"),
                              onPressed: () {
                                _txModalSheet(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text("Demo 2"),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        body: MultiWizard.icon(
                          buttonIconForward: Icon(Icons.arrow_forward),
                          buttonIconPrevious: Icon(Icons.arrow_back),
                          finishFunction: () {
                            if (key2.currentState.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => Scaffold(
                                        body: Center(child: Text("Hello")),
                                      )));
                            }
                          },
                          steps: [
                            WizardStep(
                              showPrevious: false,
                              child: Container(
                                height: double.infinity,
                                child: Wrap(
                                  direction: Axis.vertical,
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    ClipRect(
                                      child: Image.network(
                                          "https://i0.wp.com/www.logoworks.com/blog/wp-content/uploads/2014/03/fruit-vegetable-logos-templates-logo-designs-037.png?w=325&ssl=1"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Welcome to the most amazing app ever!",
                                    ),
                                    Text("Created By Josef"),
                                  ],
                                ),
                              ),
                            ),
                            WizardStep(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(
                                        "In this demo we show how a welcome wizard can be used!"),
                                    Form(
                                      key: key2,
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (t) {
                                          if (t.length <= 1) {
                                            return "Name must be at least 2 characters long!";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "What's your name?",
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
