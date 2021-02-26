import '../../models/credit_card_model.dart';
import 'package:flutter/material.dart';

class FormCardExpiryYear extends StatelessWidget {
  FocusNode _focusNode;
  Function _updateText;
  CreditCard _creditCard;


  FormCardExpiryYear(this._focusNode, this._updateText, this._creditCard);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0)),
        ),
        items: years
            .map((e) => DropdownMenuItem(
          child: Text(e),
          value: e,
        ))
            .toList(),
        onTap: () {
          _focusNode.requestFocus();
        },
        onChanged: (String value) {
          _creditCard.expiryYear =
              value.substring(2);
          _updateText();
        },
        hint: Text("Year"),
      ),
    );
  }
}
