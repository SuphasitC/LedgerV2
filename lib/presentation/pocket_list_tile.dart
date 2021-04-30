import 'package:flutter/material.dart';
import 'package:ledger_v2/config/routes.dart';
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

  List<Shadow> shadows = [
    Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
    Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
    Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
    Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
  ];

  @override
  void initState() {
    super.initState();
    pocket = this.widget.pocket;
    refreshCallback = this.widget.refreshCallback;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: GestureDetector(
        child: Card(
          color: pocket.color,
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          pocket.name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            // shadows: shadows,
                          ),
                        ),
                      ),
                    ),
                    // Expanded(flex: 1, child: Text('My Pocket')),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 42,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          pocket.currentBalance.toString() + ' ฿',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            // shadows: shadows,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.white,
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
                                            print('Remove pocket id = ' +
                                                pocket.id),
                                            pockets.removeWhere(
                                                (deletedPocket) =>
                                                    deletedPocket.id ==
                                                    this.pocket.id),
                                            refreshCallback(),
                                            Navigator.of(context).pop()
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("No"),
                                          onPressed: () =>
                                              {Navigator.of(context).pop()},
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () => {
          Navigator.of(context)
              .pushNamed(AppRoutes.pocketPage, arguments: this.pocket)
              .then((value) => this.refreshCallback()),
        },
      ),
    );
  }
}
