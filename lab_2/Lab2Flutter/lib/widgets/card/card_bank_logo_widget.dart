import 'package:flutter/material.dart';

class CardBankLogo extends StatelessWidget {
  Alignment _alignment;
  var _fileName;


  CardBankLogo(this._alignment, this._fileName);

  @override
  Widget build(BuildContext context) {
    print(_fileName);
    return Align(
      alignment: _alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/$_fileName.png", height: 25),
      ),
    );
  }
}
