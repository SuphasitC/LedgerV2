import 'package:flutter/material.dart';
// import 'package:ledger_v2/config/routes.dart';
// import 'package:ledger_v2/pocket.dart';
import 'package:ledger_v2/transaction.dart';

class TransactionListTile extends StatefulWidget {
  final List<Transaction> transaction;
  // final Function refreshCallback;

// TransactionListTile({Key key, this.transaction, this.refreshCallback})
//       : super(key: key);
  TransactionListTile({Key key, this.transaction}) : super(key: key);

  @override
  _TransactionListTileState createState() => _TransactionListTileState();
}

class _TransactionListTileState extends State<TransactionListTile> {
  List<Transaction> transaction;
  // Function refreshCallback;

  List<Shadow> shadows = [
    Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
    Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
    Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
    Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
  ];

  @override
  void initState() {
    super.initState();
    transaction = this.widget.transaction;
    // refreshCallback = this.widget.refreshCallback;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 5),
          child: Text(
            '12 พฤศจิกายน 2021',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          height: MediaQuery.of(context).size.height * 0.27,
          child: GestureDetector(
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 67,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: InnerTransactionListTile(),
                    ),
                  ),
                  Expanded(
                    flex: 31,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'รายรับ: 50 บาท',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'รายจ่าย: 100 บาท',
                                style: TextStyle(
                                  fontSize: 25,
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
            onTap: () => {
              // Navigator.of(context)
              //     .pushNamed(AppRoutes.pocketPage, arguments: this.pocket)
              //     .then((value) => this.refreshCallback()),
            },
          ),
        ),
      ],
    );
  }
}

class InnerTransactionListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (int index) {
          return Card(
            color: Colors.blue[index * 100],
            child: Container(
              width: 50.0,
              height: 50.0,
              child: Text("$index"),
            ),
          );
        }),
      ),
    );
  }
}
