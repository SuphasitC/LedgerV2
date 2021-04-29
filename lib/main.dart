import 'package:flutter/material.dart';
import 'package:ledger_v2/pocket.dart';
import 'package:ledger_v2/presentation/add_pocket_page.dart';
import 'package:ledger_v2/presentation/pocket_list_tile.dart';
import 'presentation/app_drawer_listtile.dart';
import 'config/routes.dart';

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
      onGenerateRoute: route,
      home: HomePage(title: 'MyPocket'),
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
  void refresh() {
    this.setState(() {});
  }

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
            pockets.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: pockets.length,
                      itemBuilder: (context, index) => PocketListTile(
                        pocket: pockets[index],
                        refreshCallback: refresh,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red[500],
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      width: 400,
                      height: 120,
                      child: Text(
                        "Add some pocket.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .pushNamed(AppRoutes.addPocket)
              .then((value) => this.setState(() {})),
        },
        tooltip: 'Add Pocket',
        child: Icon(Icons.add),
      ),
    );
  }
}

Route route(RouteSettings settings) {
  Pocket pocket = settings.arguments;
  // if (settings.name == AppRoutes.myPocket) {
  //   return MaterialPageRoute(builder: (context) {
  //     return MyPocket();
  //   });
  // }
  if (settings.name == AppRoutes.addPocket) {
    return MaterialPageRoute(builder: (context) {
      return AddPocketPage();
    });
  }
  return null;
}
