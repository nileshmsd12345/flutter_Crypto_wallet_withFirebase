import 'package:flutter/material.dart';
import 'package:flutter_crypto_wallet/net/flutterfire.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];
  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            onChanged: (String value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      height: 40,
                      width: 80,
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      child: Center(
                          child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                value: value,
              );
            }).toList(),
          ),
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blueAccent.withOpacity(0.8),
                width: MediaQuery.of(context).size.width / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(67, 0, 67, 0),
                      labelText: "Coin Amount",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.blueAccent.withOpacity(0.8),
              ),
              child: MaterialButton(
                onPressed: () async {
                  await addCoin(dropdownValue, _amountController.text);
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
