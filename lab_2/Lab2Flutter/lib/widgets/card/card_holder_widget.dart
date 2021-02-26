import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  var _focus;
  var _holder;


  CardHolder(this._focus, this._holder);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: _focus
              ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 2))
              : null,
          height: 40,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Card Holder",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                _holder
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
