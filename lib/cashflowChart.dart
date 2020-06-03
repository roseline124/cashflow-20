import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CashflowChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CashflowChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate, barGroupingType: charts.BarGroupingType.grouped);
  }
}

class OrdinalCashflow {
  final String category;
  final int amounts;

  OrdinalCashflow(this.category, this.amounts);
}
