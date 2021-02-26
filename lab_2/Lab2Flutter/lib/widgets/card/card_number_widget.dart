import 'package:flutter/material.dart';

class CardNumber extends StatelessWidget {
  var _focus;
  var _number;

  CardNumber(this._focus, this._number);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: _focus
              ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 2))
              : null,
          width: double.infinity,
          child: Text(
            _number,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
