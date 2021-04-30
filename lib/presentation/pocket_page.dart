import 'package:flutter/material.dart';
import 'package:ledger_v2/pocket.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
