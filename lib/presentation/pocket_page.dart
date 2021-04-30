import 'package:flutter/material.dart';
import 'package:ledger_v2/pocket.dart';
import 'package:ledger_v2/presentation/gauge_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PocketPage extends StatefulWidget {
  final Pocket pocket;
  PocketPage({Key key, this.pocket}) : super(key: key);

  @override
  _PocketPageState createState() => _PocketPageState();
}

class _PocketPageState extends State<PocketPage> {
  Pocket pocket;
  Function refreshCallback;

  @override
  void initState() {
    super.initState();
    pocket = this.widget.pocket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Pocket: ' + pocket.name),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GaugeChart(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Expense',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'Ratio',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
