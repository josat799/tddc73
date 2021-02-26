import 'package:Lab2Flutter/models/credit_card_model.dart';
import 'package:flutter/material.dart';

class FormCardName extends StatelessWidget {
  FocusNode _focusNode;
  Function _updateText;
  CreditCard _creditCard;


  FormCardName(this._focusNode, this._updateText, this._creditCard);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onChanged: (value) {
        _creditCard.cardHolder = value;
        _updateText();
      },
      decoration: InputDecoration(
        labelText: "Card Name",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
