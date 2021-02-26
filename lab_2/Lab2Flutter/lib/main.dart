import 'package:flutter/material.dart';

import './widgets/credit_card_widget.dart' as cc;
import './widgets/credit_card_form_widget.dart';
import './models/credit_card_model.dart' as ccModel;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CreditCardValidator(),
    );
  }
}

class CreditCardValidator extends StatefulWidget {
  @override
  _CreditCardValidatorState createState() => _CreditCardValidatorState();
}

class _CreditCardValidatorState extends State<CreditCardValidator> {
  ccModel.CreditCard creditCard = ccModel.CreditCard();

  bool isFront = true;

  Map<String, bool> focuses = {
    "cardNumber": false,
    "cardHolder": false,
    "expiryDate": false,
  };

  void _updateFocuses(Map<String, bool> focuses) {
    setState(() {
      this.focuses = focuses;
    });
  }

  _turnCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  _updateCreditCardInformation(ccModel.CreditCard creditCard) {
    setState(() {
      this.creditCard = creditCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: Colors.white,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 125.0),
                      child: CreditCardForm(
                        turnCard: this._turnCard,
                        creditCardInformation: this.creditCard,
                        updateCreditCardInformation:
                            _updateCreditCardInformation,
                        updateFocus: _updateFocuses,
                      ),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: cc.CreditCard(
                      updateCreditCardInformation: _updateCreditCardInformation,
                      creditCardInformation: this.creditCard,
                      height: 200,
                      width: 350,
                      isFront: this.isFront,
                      focuses: this.focuses,
                    )),
              ],
            ),
          ),
        ));
  }
}
