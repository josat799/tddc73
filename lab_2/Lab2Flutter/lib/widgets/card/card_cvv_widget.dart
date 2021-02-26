import 'package:flutter/material.dart';

class CardCVV extends StatelessWidget {
  var _cvv;


  CardCVV(this._cvv);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "CVV",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                alignment: Alignment.centerRight,
                height: 40,
                width: double.infinity,
                child: Text(
                  _cvv,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
