import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Jan-20 at 20:50.***
///***************************************************/

class AddTx extends StatefulWidget {
  final Function addTx;

  AddTx({this.addTx});

  @override
  _AddTxState createState() => _AddTxState();
}

class _AddTxState extends State<AddTx> {
  final title = TextEditingController();

  final price = TextEditingController();

  void submitData() {
    var dPrice = double.parse(price.text);
    if (title.text.isEmpty || dPrice <= 0) {
      return;
    }
    widget.addTx(title.text, dPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 3,
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: title,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'price'),
                  controller: price,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Text('No Date Chosen'),
                      FlatButton(
                        child: Text(
                          'Choose a date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: showDate,
                        textColor: Theme
                            .of(context)
                            .primaryColor,
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .buttonColor),
                  ),
                  onPressed: submitData,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
              ],
            ),
          ),
        ));
  }

  void showDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());
  }
}
