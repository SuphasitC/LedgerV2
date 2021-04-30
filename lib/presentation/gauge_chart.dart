/// Gauge chart example, where the data does not cover a full revolution in the
/// chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

const pi = 3.14159265359;

List<GaugeSegment> chartData = [
  GaugeSegment('Food', 75, Color(0xff3366cc)),
  GaugeSegment('Electronics', 100, Color(0xff990099)),
  GaugeSegment('HabitatRenting', 5, Color(0xff109618)),
  GaugeSegment('Investment', 10, Color(0xfffdbe19)),
  GaugeSegment('etc', 50, Color(0xffff9900)),
];

class GaugeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.4,
      child: charts.PieChart(
        fetchChartData(),
        animate: true,
        defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 40,
          startAngle: 4 / 5 * pi,
          arcLength: 7 / 5 * pi,
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
            segment.size, //size of chart segment
        colorFn: (GaugeSegment segment, _) =>
            // charts.ColorUtil.fromDartColor(segment.color),
            charts.ColorUtil.fromDartColor(Colors.orange),
        data: chartData,
        labelAccessorFn: (GaugeSegment segment, _) => '${segment.size}',
      )
    ];
  }
}

class GaugeSegment {
  final String segment;
  final int size;
  final Color color;

  GaugeSegment(this.segment, this.size, this.color);
}
