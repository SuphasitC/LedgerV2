import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/services.dart';
import 'package:ledger_v2/config/routes.dart';
import '../pocket.dart';

class AddPocketPage extends StatefulWidget {
  AddPocketPage({Key key}) : super(key: key);

  @override
  _AddPocketPageState createState() => _AddPocketPageState();
}

class _AddPocketPageState extends State<AddPocketPage> {
  final pocketNameController = TextEditingController(text: 'My Pocket');
  final initialBalanceController = TextEditingController(text: '0');

  bool validatePocketName = false;
  bool validateInitialBalance = false;

  Color pocketColor = Colors.black;

  void createPocket() {
    checkTextFieldValidationState();
    if (!validatePocketName && !validateInitialBalance) {
      String pocketName = pocketNameController.text;
      double initialBalance = double.parse(initialBalanceController.text);
      String pocketID = generatePocketID();
      print('pocketID = ' + pocketID);
      pockets.add(Pocket(pocketName, initialBalance, pocketColor, pocketID));
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

  void changeColor(Color color) {
    this.setState(() {
      pocketColor = color;
    });
  }

  String generatePocketID() {
    String generatedID = UniqueKey().toString();
    return generatedID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create Pocket'),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.credit_card_rounded,
                  color: Colors.black,
                ),
                Text(
                  ' Pocket Name',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                controller: pocketNameController,
                onChanged: (text) => {
                  this.setState(() {
                    validatePocketName = false;
                  }),
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.black,
                ),
                Text(
                  ' Initial Balance',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                controller: initialBalanceController,
                onChanged: (text) => {
                  this.setState(() {
                    validateInitialBalance = false;
                  }),
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.color_lens,
                  color: Colors.black,
                ),
                Text(
                  ' Pocket Color',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  color: Colors.black,
                ),
                child: RaisedButton(
                  color: pocketColor,
                  elevation: 3.0,
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: BlockPicker(
                                pickerColor: pocketColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Select',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  setState(() => {});
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        })
                  },
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
