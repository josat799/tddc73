import 'package:flutter/material.dart';
class FormCardSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {},
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
