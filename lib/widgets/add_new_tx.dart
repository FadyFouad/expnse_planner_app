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
                FlatButton(
                  child: Text('Add'),
                  onPressed: submitData,

                  textColor: Colors.purple,
                )
              ],
            ),
          ),
        ));
  }
}
