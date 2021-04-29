import 'package:flutter/material.dart';
import 'presentation/app_drawer_listtile.dart';

void main() {
  runApp(LedgerApp());
}

class LedgerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LedgerApp',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'FCMinimal'),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'LedgerAPP'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addPocket() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
            for (int idx = 0; idx < drawerList.length; idx++)
              DrawerListTile(idx),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pocket',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPocket,
        tooltip: 'Add Pocket',
        child: Icon(Icons.add),
      ),
    );
  }
}
