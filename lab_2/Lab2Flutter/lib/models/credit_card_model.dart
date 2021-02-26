class CreditCard {
  String cardNumber, cardHolder, expiryDate, expiryYear, cvvCode;
  int cvvLength;
  BankLogoTypes logoType;


  CreditCard(
      {this.cardNumber = "#### #### #### ####",
      this.cardHolder = "AD SOYAD",
      this.expiryDate = "MM",
      this.expiryYear = "YY",
      this.cvvCode = ""});

  updateCardNumber(String value) {
    List<String> numbers = [];
    this.cardNumber = "#### #### #### ####";
    for (int i = 0; i < value.length; i++) {
      numbers.add(value.substring(i, i + 1));
    }
    numbers.forEach((element) {
      this.cardNumber = this.cardNumber.replaceFirst("#", element);
    });
    if (numbers.isNotEmpty) {
      _updateBankInformation(numbers.first);
    }
  }

  void _updateBankInformation(String firstDigit) {
    print(firstDigit);
    cvvLength = 3;
    switch (firstDigit) {
      case "3":
        logoType = BankLogoTypes.americanExpress;
        cvvLength = 4;
        break;
      case "4":
        logoType = BankLogoTypes.visa;
        break;
      case "5":
        logoType = BankLogoTypes.masterCard;
        break;
      case "6":
        logoType = BankLogoTypes.discovery;
        break;
      default:
        logoType = BankLogoTypes.masterCard;
        break;
    }
  }
}

enum BankLogoTypes {
  americanExpress,
  visa,
  dinersClub,
  discovery,
  jcb,
  masterCard,
  troy,
  unionPay,
}

const List<String> months = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
];

const List<String> years = [
  "2019",
  "2020",
  "2021",
  "2022",
  "2023",
  "2024",
  "2025",
  "2026",
  "2027",
  "2028",
  "2029",
  "2030",
];
