import 'package:Lab2Flutter/models/credit_card_model.dart';
import 'package:flutter/material.dart';

class FormCardCVV extends StatelessWidget {
  FocusNode _focusNode;
  Function _updateText;
  CreditCard _creditCard;


  FormCardCVV(this._focusNode, this._updateText, this._creditCard);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLength: _creditCard.cvvLength,
        onChanged: (value) {
          _creditCard.cvvCode = value;
          _updateText();
        },
        keyboardType: TextInputType.number,
        focusNode: _focusNode,
        decoration: InputDecoration(
          counterText: "",
          labelText: "CCV",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
