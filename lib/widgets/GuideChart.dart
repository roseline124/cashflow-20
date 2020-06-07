import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GuideChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GuideChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: true,
          desiredMaxRows: 2,
          cellPadding: new EdgeInsets.only(right: 10.0, bottom: 10.0),
          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 255, g: 102, b: 102), fontSize: 11),
        )
      ],
    );
  }
}

class OrdinalCashflow {
  final String category;
  final int amounts;

  OrdinalCashflow(this.category, this.amounts);
}
