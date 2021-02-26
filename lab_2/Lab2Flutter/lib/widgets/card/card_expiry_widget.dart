import 'package:flutter/material.dart';

class CardExpiry extends StatelessWidget {
  var _focus;
  var _date;
  var _year;


  CardExpiry(this._focus, this._date, this._year);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: _focus
              ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 2))
              : null,
          height: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Expires",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "${_date}/${_year}",
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
