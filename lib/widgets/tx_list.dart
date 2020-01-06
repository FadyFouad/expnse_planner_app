import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

///****************************************************
///*** Created by Fady Fouad on 03-Jan-20 at 00:06.***
///***************************************************/

class TxList extends StatelessWidget {

  final List<Transaction> transactions;

  const TxList({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transaction;
    return Container(
        child: Column(
      children: transactions.map((transaction) {
        return Card(
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '${transaction.title}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${DateFormat().add_yMMMd().format(transaction.date)}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    ' ${transaction.price} \$',
                    style: (TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                    )),
                  ),
                  padding: EdgeInsets.all(4),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ));
  }
}
