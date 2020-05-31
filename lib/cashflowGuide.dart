import 'package:flutter/material.dart';

class CashFlowGuide extends StatelessWidget {
  CashFlowGuide(
      {this.totalIncome,
      this.fixedCost,
      this.variableCost,
      this.emergencyFund,
      this.otherCost});

  final int totalIncome;
  final int fixedCost;
  final int variableCost;
  final int emergencyFund;
  final int otherCost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(fixedCost.toString()),
        ),
      ),
    );
  }
}
