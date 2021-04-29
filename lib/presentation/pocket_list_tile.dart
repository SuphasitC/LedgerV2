import 'package:flutter/material.dart';
import 'package:ledger_v2/pocket.dart';

class PocketListTile extends StatefulWidget {
  final int index;
  PocketListTile({Key key, this.index}) : super(key: key);

  @override
  _PocketListTileState createState() => _PocketListTileState();
}

class _PocketListTileState extends State<PocketListTile> {
  int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(pockets[index].pocketName),
      trailing: Text(pockets[index].currentBalance.toString()),
    );
  }
}
