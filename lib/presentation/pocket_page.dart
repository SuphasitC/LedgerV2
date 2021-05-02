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
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // color: Colors.blue[500],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    'Income/Expense Pie Chart',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GaugeChart(),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10, right: 10),
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
                                    activeBgColors: [
                                      Colors.blue[700],
                                      Colors.blue[700],
                                    ],
                                    onToggle: (index) {
                                      if (index == 0) {
                                        print('Switched to pie chart');
                                      } else {
                                        print('Switched to bar chart');
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.green[100],
                                        child: Text(
                                          'รายรับ : 55 %',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.red[100],
                                        child: Text(
                                          'รายจ่าย : 45 %',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          'ประหยัดอยู่นะ',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width - 10,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  color: Colors.orange,
                  child: Row(
                    children: [
                      Icon(
                        Icons.view_day,
                      ),
                      Icon(
                        Icons.calendar_today,
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
              child: ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (context, index) => TransactionListTile(
                  transaction: transaction[index],
                  // refreshCallback: refreshCallback,
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
