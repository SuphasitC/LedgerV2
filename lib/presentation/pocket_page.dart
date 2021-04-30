import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ledger_v2/config/routes.dart';
import 'package:ledger_v2/pocket.dart';
import 'package:ledger_v2/presentation/gauge_chart.dart';
import 'package:ledger_v2/presentation/transaction_list_tile.dart';
import 'package:ledger_v2/transaction.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
            flex: 2,
            child: Row(
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
                      Positioned(
                        top: 20,
                        right: 15,
                        child: ToggleSwitch(
                          minWidth: 40.0,
                          initialLabelIndex: 0,
                          cornerRadius: 10.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          labels: ['', ''],
                          icons: [
                            FontAwesomeIcons.chartPie,
                            FontAwesomeIcons.chartBar
                          ],
                          activeBgColors: [Colors.blue, Colors.blue],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[300],
              child: Expanded(
                child: ListView.builder(
                  itemCount: transaction.length,
                  itemBuilder: (context, index) => TransactionListTile(
                    transaction: transaction[index],
                    // refreshCallback: refreshCallback,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'เพิ่มรายการ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => {
          // Navigator.of(context)
          //     .pushNamed(AppRoutes.addPocket)
          //     .then((value) => this.setState(() {})),
        },
        tooltip: 'Add Transaction',
        icon: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
