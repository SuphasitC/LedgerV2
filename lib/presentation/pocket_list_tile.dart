import 'package:flutter/material.dart';
import 'package:ledger_v2/pocket.dart';

class PocketListTile extends StatefulWidget {
  final Pocket pocket;
  final Function refreshCallback;
  PocketListTile({Key key, this.pocket, this.refreshCallback})
      : super(key: key);

  @override
  _PocketListTileState createState() => _PocketListTileState();
}

class _PocketListTileState extends State<PocketListTile> {
  Pocket pocket;
  Function refreshCallback;

  @override
  void initState() {
    super.initState();
    pocket = this.widget.pocket;
    refreshCallback = this.widget.refreshCallback;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: ListTile(
        leading: Text(
          pocket.pocketName,
          style: TextStyle(fontSize: 30),
        ),
        trailing: Wrap(
          spacing: 12,
          children: [
            Text(
              pocket.currentBalance.toString(),
              // textScaleFactor: 1.25,
              style: TextStyle(fontSize: 30),
            ),
            GestureDetector(
              child: Icon(
                Icons.delete,
                size: 25,
              ),
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Deleting pocket",
                        style: TextStyle(fontSize: 25),
                      ),
                      content: Text(
                        "Are you sure to remove this pocket?",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Yes"),
                          onPressed: () => {
                            pockets.removeWhere((deletedPocket) =>
                                deletedPocket.pocketID == this.pocket.pocketID),
                            refreshCallback(),
                            Navigator.of(context).pop()
                          },
                        ),
                        FlatButton(
                          child: Text("No"),
                          onPressed: () => {Navigator.of(context).pop()},
                        ),
                      ],
                    );
                  },
                ),
              },
            ),
          ],
        ),
        // trailing: Text(
        //   pockets[index].currentBalance.toString(),
        //   textScaleFactor: 1.25,
        //   style: TextStyle(fontSize: 30),
        // ),
        tileColor: pocket.pocketColor,
      ),
    );
  }
}
