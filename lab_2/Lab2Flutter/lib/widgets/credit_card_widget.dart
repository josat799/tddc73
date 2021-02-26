import 'package:flutter/material.dart';

import '../widgets/card/card_bank_logo_widget.dart';
import '../widgets/card/card_expiry_widget.dart';
import '../widgets/card/card_holder_widget.dart';
import '../widgets/card/card_number_widget.dart';
import '../widgets/card/card_bar_widget.dart';
import '../widgets/card/card_chip_widget.dart';
import '../widgets/card/card_cvv_widget.dart';

import '../models/credit_card_model.dart' as cc;

class CreditCard extends StatefulWidget {
  cc.CreditCard creditCardInformation;
  double height;
  double width;
  bool isFront = true;
  final void Function(
    bool isFront,
  ) turnCard;
  final void Function(
    cc.CreditCard creditCardInformation,
  ) updateCreditCardInformation;

  Map<String, bool> focuses;

  @override
  _CreditCardState createState() => _CreditCardState();

  CreditCard(
      {this.updateCreditCardInformation,
      this.creditCardInformation,
      this.height,
      this.width,
      this.isFront,
      this.turnCard,
      this.focuses});
}

class _CreditCardState extends State<CreditCard> {
  String fileName;

  updateLogo() {
    setState(() {
      switch (widget.creditCardInformation.logoType) {
        case cc.BankLogoTypes.visa:
          fileName = "visa";
          break;
        case cc.BankLogoTypes.americanExpress:
          fileName = "amex";
          break;
        case cc.BankLogoTypes.discovery:
          fileName = "discover";
          break;
        case cc.BankLogoTypes.masterCard:
          fileName = "mastercard";
          break;
        default:
          fileName = "amex";
          break;
      }
    });
  }

  @override
  void didUpdateWidget(CreditCard oldWidget) {
    updateLogo();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    updateLogo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/images/17.jpeg'), fit: BoxFit.fill),
      ),
      child: Stack(
        children: widget.isFront
            ? <Widget>[
                const CardChip(),
                CardBankLogo(Alignment.topRight, fileName),
                CardHolder(widget.focuses["cardHolder"],
                    widget.creditCardInformation.cardHolder),
                CardExpiry(
                    widget.focuses["expiryDate"],
                    widget.creditCardInformation.expiryDate,
                    widget.creditCardInformation.expiryYear),
                CardNumber(widget.focuses["cardNumber"],
                    widget.creditCardInformation.cardNumber),
              ]
            : <Widget>[
                const CardBar(),
                CardCVV(widget.creditCardInformation.cvvCode),
                CardBankLogo(Alignment.bottomRight, fileName),
              ],
      ),
    );
  }
}
