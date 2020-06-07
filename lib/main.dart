import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screens/CashFlowScreen/CashFlowForm.dart';

void main() {
  runApp(CashFlow());
}

class CashFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new SplashScreen(
            seconds: 3,
            navigateAfterSeconds: new AfterSplash(),
            title: new Text(
              '귀여운 20대들의\n통장분리 가이드',
              textAlign: TextAlign.center,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            image: new Image.asset(
              'static/images/launchImage.png',
              width: 150,
            ),
            photoSize: 100.0, // percent
            backgroundColor: Colors.white,
            loaderColor: Colors.blue,
            loadingText: Text('잠시만 기다려주세요')),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[400],
        accentColor: Colors.amber[400],
      ),
      title: '20대 통장 분리 가이드',
      home: Scaffold(
        appBar: AppBar(title: Text('20대 통장 분리 가이드')),
        body: CashFlowForm(),
      ),
    );
  }
}
