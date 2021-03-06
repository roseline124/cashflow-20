import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:cashflow20/Widgets/GuideChart.dart';
import '../FundMoneyFlowScreen/FundMoneyFlowForm.dart';
import 'package:cashflow20/Widgets/SubmitButton.dart';
import 'package:bubble/bubble.dart';

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
    final Map<String, int> guide = {
      'fixedCost': (totalIncome * 0.1).round(),
      'variableCost': (totalIncome * 0.3).round(),
      'emergencyFund': (totalIncome * 0.1).round(),
      'otherCost': (totalIncome * 0.4).round(),
    };
    final maxEmergencyFund = totalIncome * 3;
    final savingsAmount = otherCost / 4;
    final insuranceAmount = totalIncome / 10;

    List<charts.Series<OrdinalCashflow, String>> _createData() {
      final data = [
        new OrdinalCashflow('고정지출', fixedCost),
        new OrdinalCashflow('변동지출', variableCost),
        new OrdinalCashflow('비상자금', emergencyFund),
        new OrdinalCashflow('기타', otherCost),
      ];

      final guideData = [
        new OrdinalCashflow('고정지출', guide['fixedCost']),
        new OrdinalCashflow('변동지출', guide['variableCost']),
        new OrdinalCashflow('비상자금', guide['emergencyFund']),
        new OrdinalCashflow('기타', guide['otherCost']),
      ];

      return [
        new charts.Series<OrdinalCashflow, String>(
          id: '현재 지출',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.amber[400]),
          domainFn: (OrdinalCashflow cashflow, _) => cashflow.category,
          measureFn: (OrdinalCashflow cashflow, _) => cashflow.amounts,
          data: data,
        ),
        new charts.Series<OrdinalCashflow, String>(
          id: '지출 가이드',
          colorFn: (_, __) =>
              charts.ColorUtil.fromDartColor(Colors.deepOrange[400]),
          domainFn: (OrdinalCashflow cashflow, _) => cashflow.category,
          measureFn: (OrdinalCashflow cashflow, _) => cashflow.amounts,
          data: guideData,
        ),
      ];
    }

    return Scaffold(
      appBar: AppBar(title: Text('이렇게 해보세요.')),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 300,
              child: Flex(
                  direction: Axis.horizontal,
                  children: [Expanded(child: GuideChart(_createData()))])),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      'static/images/consultant.jpeg',
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 10),
                  nip: BubbleNip.leftTop,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        fixedCost + variableCost >=
                                guide['fixedCost'] + guide['variableCost']
                            ? Text(
                                '고정지출이 좀 많네요!',
                                style: TextStyle(fontSize: 12),
                              )
                            : Text(
                                '고정지출을 늘리셔도 괜찮습니다!',
                                style: TextStyle(fontSize: 12),
                              ),
                        emergencyFund <= guide['emergencyFund']
                            ? Text(
                                '비상자금을 더 준비하셔야 합니다!',
                                style: TextStyle(fontSize: 12),
                              )
                            : Text(
                                '비상자금을 준비했군요. 훌륭합니다!',
                                style: TextStyle(fontSize: 12),
                              ),
                        Text(
                          '비상자금의 한도는 $maxEmergencyFund 만 원입니다.',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '적정 적금은 $savingsAmount 만 원입니다.',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '적정 보험료는은 $insuranceAmount 만 원입니다.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SubmitButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FundMoneyFlow(
                              guideOtherCost: guide['otherCost'],
                            )));
              },
              label: '투자는 어떻게 하고 계신가요?')
        ]),
      ),
    );
  }
}
