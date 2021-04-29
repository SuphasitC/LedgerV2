import 'package:flutter/material.dart';

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
        Navigator.pop(context),
      },
    );
  }
}
