import 'package:flutter/material.dart';
import 'package:ledger_v2/config/routes.dart';
import '../pocket.dart';

class AddPocketPage extends StatefulWidget {
  AddPocketPage({Key key}) : super(key: key);

  @override
  _AddPocketPageState createState() => _AddPocketPageState();
}

class _AddPocketPageState extends State<AddPocketPage> {
  final pocketNameController = TextEditingController();
  final initialBalanceController = TextEditingController();

  bool validatePocketName = false;
  bool validateInitialBalance = false;

  void createPocket() {
    checkTextFieldValidationState();
    if (!validatePocketName && !validateInitialBalance) {
      String pocketName = pocketNameController.text;
      double initialBalance = double.parse(initialBalanceController.text);
      pockets.add(Pocket(pocketName, initialBalance, Colors.blue));
      Navigator.of(context).pushNamed(AppRoutes.myPocket);
    }
  }

  void checkTextFieldValidationState() {
    String pocketName = pocketNameController.text;
    String initialBalance = initialBalanceController.text;
    print('pocketName = ' + pocketName);
    print('initialBalance = ' + initialBalance);
    this.setState(() {
      if (pocketName.isEmpty) {
        validatePocketName = true;
      } else {
        validatePocketName = false;
      }
      if (initialBalance.isEmpty || double.tryParse(initialBalance) == null) {
        validateInitialBalance = true;
      } else {
        validateInitialBalance = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create Pocket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pocket Name',
              style: TextStyle(fontSize: 40),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                style: TextStyle(fontSize: 20.0),
                controller: pocketNameController,
                onChanged: (text) => {
                  this.setState(() {
                    validatePocketName = false;
                  }),
                },
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Pocket Name',
                  errorText:
                      validatePocketName ? 'กรุณาใส่ชื่อกระเป๋าตังค์' : null,
                  errorStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Text(
              'Initial Balance',
              style: TextStyle(fontSize: 40),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20.0),
                controller: initialBalanceController,
                onChanged: (text) => {
                  this.setState(() {
                    validateInitialBalance = false;
                  }),
                },
                decoration: InputDecoration(
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Initial Balance',
                  errorText: validateInitialBalance
                      ? 'กรูณาใส่เงินในกระเป๋าตังค์เป็นตัวเลข และไม่เว้นว่าง'
                      : null,
                  errorStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                'Create Pocket',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              color: Colors.green,
              onPressed: createPocket,
            ),
          ],
        ),
      ),
    );
  }
}
