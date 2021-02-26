import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {

  const CardChip();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/chip.png',
          height: 50,
        ),
      ),
    );
  }
}
