import 'package:flutter/material.dart';
import 'package:ledger_v2/config/routes.dart';
import '../pocket.dart';

class AddPocketPage extends StatefulWidget {
  AddPocketPage({Key key}) : super(key: key);

  @override
  _AddPocketPageState createState() => _AddPocketPageState();
}

class _AddPocketPageState extends State<AddPocketPage> {
  void createPocket() {
    pockets.add(Pocket("Em's Pocket", 0, Colors.blue));
    Navigator.of(context).pushNamed(AppRoutes.myPocket);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Pocket'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Create Pocket',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: Colors.green,
          onPressed: createPocket,
        ),
      ),
    );
  }
}
