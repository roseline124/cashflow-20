import 'package:flutter/material.dart';
import './cashflowGuide.dart';

void main() {
  runApp(CashFlow());
}

String commonFieldValidator(value) {
  if (value.isEmpty) {
    return '금액을 입력해주세요.';
  }

  int valueNumber = int.tryParse(value);
  if (!(valueNumber is int)) {
    return '숫자로 적어주세요.';
  }

  return null;
}

InputDecoration getInputDecoration(String label) {
  return InputDecoration(
    hintText: '${label}을 적어주세요. (단위: 만 원)',
    labelText: '* $label',
  );
}

class CashFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '20대 통장 분리 가이드',
      home: Scaffold(
        appBar: AppBar(title: Text('20대 통장 분리 가이드')),
        body: CashFlowForm(),
      ),
    );
  }
}

class CashFlowForm extends StatefulWidget {
  CashFlowForm({Key key}) : super(key: key);

  @override
  _CashFlowFormState createState() => _CashFlowFormState();
}

class _CashFlowFormState extends State<CashFlowForm> {
  final _cachFlowFormKey = GlobalKey<FormState>();
  int _totalIncome;
  int _fixedCost;
  int _variableCost;
  int _emergencyFund;
  int _otherCost;

  void setFieldValue(value, fieldName) {
    var parsedValue = int.tryParse(value);
    if (parsedValue is int) {
      setState(() {
        fieldName = parsedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
            key: _cachFlowFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: getInputDecoration('세후 월 소득'),
                    validator: (value) {
                      int valueNumber = int.tryParse(value);
                      if (valueNumber == 0) {
                        return '그럴 리 없습니다.';
                      }
                      return commonFieldValidator(value);
                    },
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _totalIncome = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('월 고정지출'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _fixedCost = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('월 변동지출'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _variableCost = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('비상자금'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _emergencyFund = parsedValue;
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: getInputDecoration('기타자금'),
                    validator: (value) => commonFieldValidator(value),
                    onSaved: (value) {
                      var parsedValue = int.tryParse(value);
                      if (parsedValue is int) {
                        setState(() {
                          _otherCost = parsedValue;
                        });
                      }
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      final form = _cachFlowFormKey.currentState;
                      if (_cachFlowFormKey.currentState.validate()) {
                        form.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CashFlowGuide(
                                    totalIncome: _totalIncome,
                                    fixedCost: _fixedCost,
                                    variableCost: _variableCost,
                                    emergencyFund: _emergencyFund,
                                    otherCost: _otherCost,
                                  )),
                        );
                      }
                    },
                    child: Text('가이드 확인하기'),
                  )
                ])));
  }
}
