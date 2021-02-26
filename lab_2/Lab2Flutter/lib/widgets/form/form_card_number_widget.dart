import 'package:Lab2Flutter/models/credit_card_model.dart';
import 'package:flutter/material.dart';

class FormCardNumber extends StatelessWidget {
  FocusNode _focusNode;
  Function _updateText;
  CreditCard creditCard;


  FormCardNumber(this._focusNode, this._updateText, this.creditCard);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        creditCard.updateCardNumber(value);
        _updateText();
      },
      maxLength: 16,
      decoration: InputDecoration(
        counterText: "",
        labelText: "Card Number",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
