import 'package:flutter/material.dart';
import '../pocket.dart';

List<String> drawerList = [
  'หน้าแรก',
  'กระเป๋าตังค์ของฉัน',
];

class DrawerListTile extends StatelessWidget {
  final int index;

  DrawerListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        drawerList[index],
        style: TextStyle(fontSize: 20),
      ),
      onTap: () => {
        pockets.clear(),
        Navigator.pop(context),
      },
    );
  }
}

class LedgerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              'MyLedgerApp',
              style: TextStyle(fontSize: 30),
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
          ),
          for (int idx = 0; idx < drawerList.length; idx++) DrawerListTile(idx),
        ],
      ),
    );
  }
}
