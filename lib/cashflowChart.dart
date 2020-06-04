import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CashflowChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CashflowChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate, barGroupingType: charts.BarGroupingType.grouped, behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: false,
          desiredMaxRows: 2,
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 12, g: 63, b: 191),
              fontSize: 11),
        )
      ],);
  }
}

class OrdinalCashflow {
  final String category;
  final int amounts;

  OrdinalCashflow(this.category, this.amounts);
}
