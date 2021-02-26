import 'package:flutter/material.dart';

class CardBar extends StatelessWidget {
  const CardBar();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.black),
        ),
      ),
    );
  }
}
