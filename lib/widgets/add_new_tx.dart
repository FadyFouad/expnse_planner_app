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
              keyboardType: TextInputType.number,
              onSubmitted: (val) {
                addTx(title.text, double.parse(price.text));
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                addTx(title.text, double.parse(price.text));
              },

              textColor: Colors.purple,
            )
          ],
        ),
      ),
    ));
  }
}
