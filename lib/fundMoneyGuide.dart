import 'package:flutter/material.dart';

class FundMoneyGuide extends StatelessWidget {
  FundMoneyGuide({
    this.savings,
    this.installmentFund,
    this.longTermSavings,
    this.guaranteedInsurance,
  });

  final int savings;
  final int installmentFund;
  final int longTermSavings;
  final int guaranteedInsurance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        body: Text(''),
      ),
    );
  }
}
