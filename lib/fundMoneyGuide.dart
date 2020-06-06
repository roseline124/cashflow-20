import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'guideChart.dart';

class FundMoneyGuide extends StatelessWidget {
  FundMoneyGuide({
    this.guideOtherCost = 0,
    this.savings,
    this.installmentFund,
    this.longTermSavings,
    this.guaranteedInsurance,
  });

  final int guideOtherCost;
  final int savings;
  final int installmentFund;
  final int longTermSavings;
  final int guaranteedInsurance;

  @override
  Widget build(BuildContext context) {
    final Map<String, int> guide = {
      'savings': (guideOtherCost * 0.25).round(),
      'installmentFund': (guideOtherCost * 0.4).round(),
      'longTermSavings': (guideOtherCost * 0.1).round(),
      'guaranteedInsurance': (guideOtherCost * 0.25).round(),
    };

    List<charts.Series<OrdinalCashflow, String>> _createData() {
      final data = [
        new OrdinalCashflow('적금', savings),
        new OrdinalCashflow('적립식펀드', installmentFund),
        new OrdinalCashflow('장기저축', longTermSavings),
        new OrdinalCashflow('보장성보험', guaranteedInsurance),
      ];

      final guideData = [
        new OrdinalCashflow('적금', guide['savings']),
        new OrdinalCashflow('적립식펀드', guide['installmentFund']),
        new OrdinalCashflow('장기저축', guide['longTermSavings']),
        new OrdinalCashflow('보장성보험', guide['guaranteedInsurance']),
      ];

      return [
        new charts.Series<OrdinalCashflow, String>(
          id: '현재 지출',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalCashflow cashflow, _) => cashflow.category,
          measureFn: (OrdinalCashflow cashflow, _) => cashflow.amounts,
          data: data,
        ),
        new charts.Series<OrdinalCashflow, String>(
          id: '지출 가이드',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalCashflow cashflow, _) => cashflow.category,
          measureFn: (OrdinalCashflow cashflow, _) => cashflow.amounts,
          data: guideData,
        ),
      ];
    }

    return MaterialApp(
      title: '',
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 300,
                child: Flex(
                    direction: Axis.horizontal,
                    children: [Expanded(child: GuideChart(_createData()))])),
            guide['savings'] > savings
                ? Text('적금을 좀 더 하셔야겠습니다.')
                : Text('훌륭해요. 하지만 적금이 너무 많아도 좋지 않아요.'),
            guide['installmentFund'] > installmentFund
                ? Text('투자를 해보시는 것도 좋겠습니다.')
                : Text('투자에 적극적이시군요!'),
            guide['longTermSavings'] > longTermSavings
                ? Text('20대는 장기저축이 꼭 필요해요')
                : Text('장기저축을 잘하고 계시군요. 훌륭합니다!'),
            guide['guaranteedInsurance'] > guaranteedInsurance
                ? Text('보험료는 적당하지만, 내용이 중요합니다.')
                : Text('보험료가 조금 과한 느낌이 있습니다.'),
          ]),
        ),
      ),
    );
  }
}
