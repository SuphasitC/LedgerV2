import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

const pi = 3.14159265359;

List<GaugeSegment> chartData = [
  GaugeSegment('Habitat Renting', 45, Color(0xffdc3912)),
  GaugeSegment('Food', 55, Color(0xff58cb4e)),
  // GaugeSegment('Electronics', 10, Color(0xff3366cc)),
  // GaugeSegment('Investment', 5, Color(0xff109618)),
  // GaugeSegment('etc', 10, Color(0xff990099)),
];

class GaugeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.3,
      child: charts.PieChart(
        fetchChartData(),
        animate: true,
        // behaviors: [
        //   charts.DatumLegend(
        //     position: charts.BehaviorPosition.bottom,
        //     outsideJustification: charts.OutsideJustification.end,
        //     horizontalFirst: false,
        //     desiredMaxRows: 2,
        //     cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
        //     entryTextStyle: charts.TextStyleSpec(
        //       // color: charts.MaterialPalette.purple.shadeDefault,
        //       fontSize: 15,
        //     ),
        //   )
        // ],
        defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 40,
          startAngle: 2.5 / 5 * pi,
          // arcLength: 7 / 5 * pi,
          arcLength: 10 / 5 * pi,
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside,
              outsideLabelStyleSpec: charts.TextStyleSpec(
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  static List<charts.Series<GaugeSegment, String>> fetchChartData() {
    return [
      charts.Series<GaugeSegment, String>(
        id: 'Expense',
        domainFn: (GaugeSegment segment, _) =>
            segment.segment, //each data of chart
        measureFn: (GaugeSegment segment, _) =>
            segment.value, //value of chart segment
        colorFn: (GaugeSegment segment, _) =>
            charts.ColorUtil.fromDartColor(segment.color),
        data: chartData,
        labelAccessorFn: (GaugeSegment segment, _) => '${segment.value}',
      )
    ];
  }
}

class GaugeSegment {
  final String segment;
  final int value;
  final Color color;

  GaugeSegment(this.segment, this.value, this.color);
}
