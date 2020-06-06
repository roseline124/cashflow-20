import 'package:flutter/material.dart';

import 'main.dart';
import 'fundMoneyGuide.dart';

class FundMoneyFlow extends StatelessWidget {
  const FundMoneyFlow({this.guideOtherCost});

  final int guideOtherCost;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '투자 현황',
      home: Scaffold(
          appBar: AppBar(
            title: Text('투자는 어떻게 하고 계신가요?'),
            leading: BackButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop()),
          ),
          body: Container(
              child: FundMoneyFlowForm(
            guideOtherCost: guideOtherCost,
          ))),
    );
  }
}

class FundMoneyFlowForm extends StatefulWidget {
  FundMoneyFlowForm({this.guideOtherCost});
  final int guideOtherCost;

  @override
  _FundMoneyFlowFormState createState() =>
      _FundMoneyFlowFormState(guideOtherCost: guideOtherCost);
}

class _FundMoneyFlowFormState extends State<FundMoneyFlowForm> {
  _FundMoneyFlowFormState({this.guideOtherCost});
  final _fundMoneyFlowFormKey = GlobalKey<FormState>();

  final int guideOtherCost;
  int _savings; // 적금
  int _installmentFund; // 적립식펀드
  int _longTermSavings; // 장기저축
  int _guaranteedInsurance; // 보장성보험

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
            key: _fundMoneyFlowFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: getInputDecoration('적금 금액'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _savings = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('투자 금액'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _installmentFund = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('장기저축 금액'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _longTermSavings = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('보장성 보험 금액'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _guaranteedInsurance = parsedValue;
                        });
                      }
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      final form = _fundMoneyFlowFormKey.currentState;
                      if (_fundMoneyFlowFormKey.currentState.validate()) {
                        form.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundMoneyGuide(
                                    guideOtherCost: guideOtherCost,
                                    savings: _savings,
                                    installmentFund: _installmentFund,
                                    longTermSavings: _longTermSavings,
                                    guaranteedInsurance: _guaranteedInsurance,
                                  )),
                        );
                      }
                    },
                    child: Text('가이드 확인하기'),
                  )
                ])));
  }
}
