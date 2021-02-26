import 'package:flutter/material.dart';

import '../widgets/form/form_card_cvv_widget.dart';
import '../widgets/form/form_card_expiry_date_widget.dart';
import '../widgets/form/form_card_expiry_year_widget.dart';
import '../widgets/form/form_card_name_widget.dart';
import '../widgets/form/form_card_number_widget.dart';
import '../models/credit_card_model.dart';
import 'form/form_card_submit_widget.dart';

class CreditCardForm extends StatefulWidget {
  CreditCard creditCardInformation;
  final void Function(
    CreditCard creditCardInformation,
  ) updateCreditCardInformation;

  final void Function() turnCard;

  final void Function(Map<String, bool> focuses) updateFocus;

  CreditCardForm(
      {this.creditCardInformation,
      this.updateCreditCardInformation,
      this.turnCard,
      this.updateFocus});

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  FocusNode CVVFocusNode;
  FocusNode cardNumberFocusNode;
  FocusNode cardHolderFocusNode;
  FocusNode expiryFocusNode;


  Map<String, bool> _focuses = {
    "cardNumber": false,
    "cardHolder": false,
    "expiryDate": false,
    "ccv": false,
  };

  @override
  void initState() {
    super.initState();
    CVVFocusNode = FocusNode();
    cardHolderFocusNode = FocusNode();
    cardNumberFocusNode = FocusNode();
    expiryFocusNode = FocusNode();

    CVVFocusNode.addListener(() {
      if (CVVFocusNode.hasFocus) {
        _focuses = {
          "cardNumber": false,
          "cardHolder": false,
          "expiryDate": false,
        };
        widget.turnCard();
      } else {
        widget.turnCard();
      }
    });

    cardHolderFocusNode.addListener(() {
      if (cardHolderFocusNode.hasFocus) {
        _focuses = {
          "cardNumber": false,
          "cardHolder": true,
          "expiryDate": false,
        };
        widget.updateFocus(_focuses);
      }
    });

    cardNumberFocusNode.addListener(() {
      if (cardNumberFocusNode.hasFocus) {
        _focuses = {
          "cardNumber": true,
          "cardHolder": false,
          "expiryDate": false,
        };
        widget.updateFocus(_focuses);
      }
    });

    expiryFocusNode.addListener(() {
      if (expiryFocusNode.hasFocus) {
        print("----- expry");
        _focuses = {
          "cardNumber": false,
          "cardHolder": false,
          "expiryDate": true,
        };
        widget.updateFocus(_focuses);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    CVVFocusNode.dispose();
    expiryFocusNode.dispose();
    cardNumberFocusNode.dispose();
    cardHolderFocusNode.dispose();
  }

  void _updateCreditCardInformation() {
    widget.updateCreditCardInformation(widget.creditCardInformation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormCardNumber(cardNumberFocusNode,
                    _updateCreditCardInformation, widget.creditCardInformation),
                SizedBox(height: 16),
                FormCardName(cardHolderFocusNode, _updateCreditCardInformation,
                    widget.creditCardInformation),
                SizedBox(height: 16),
                //TextFormField(),
                Row(
                  children: [
                    FormCardExpiryDate(
                        expiryFocusNode,
                        _updateCreditCardInformation,
                        widget.creditCardInformation),
                    SizedBox(width: 8.0),
                    FormCardExpiryYear(
                        expiryFocusNode,
                        _updateCreditCardInformation,
                        widget.creditCardInformation),
                    SizedBox(width: 8.0),
                    FormCardCVV(CVVFocusNode, _updateCreditCardInformation,
                        widget.creditCardInformation),
                  ],
                ),
                FormCardSubmit(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
