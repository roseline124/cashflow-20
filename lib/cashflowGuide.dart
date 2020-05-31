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
    final Map<String, double> guide = {
      'fixedCost': totalIncome * 0.1,
      'variableCost': totalIncome * 0.3,
      'emergencyFund': totalIncome * 0.1,
      'otherCost': totalIncome * 0.4,
    };
    final maxEmergencyFund = totalIncome * 3;
    final savingsAmount = otherCost / 4;
    final insuranceAmount = totalIncome / 10;

    return Scaffold(
      appBar: AppBar(title: Text('이렇게 해보시오.')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Row(
            children: <Widget>[
              Text('고정지출:'),
              fixedCost + variableCost >=
                      guide['fixedCost'] + guide['variableCost']
                  ? Text('지출이 좀 많네요!')
                  : Text('지출을 늘리셔도 괜찮습니다!'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('비상자금:'),
              emergencyFund <= guide['emergencyFund']
                  ? Text('비상자금을 더 준비하셔야 합니다!')
                  : Text('훌륭합니다!'),
            ],
          ),
          Text('비상자금의 한도는 $maxEmergencyFund 만 원입니다.'),
          Text('적정 적금은 $savingsAmount 만 원입니다.'),
          Text('비상자금의 한도는 $insuranceAmount 만 원입니다.'),

          // TODO:: 최상단 좌측에 버튼으로 변경하기
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('뒤로 가기'),
          ),
        ]),
      ),
    );
  }
}
