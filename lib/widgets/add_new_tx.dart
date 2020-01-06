import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Jan-20 at 20:50.***
///***************************************************/

class AddTx extends StatelessWidget {
  final Function addTx;
  final title = TextEditingController();
  final price = TextEditingController();

  AddTx({this.addTx});

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
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                addTx(title.text, double.parse(price.text));
//                        transactions.add(Transaction(
//                            id: '1',
//                            title: title,
//                            price: 1.1,
//                            date: DateTime.now()));
              },
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    ));
  }
}
