import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

///****************************************************
///*** Created by Fady Fouad on 03-Jan-20 at 00:06.***
///***************************************************/

class TxList extends StatefulWidget {
  @override
  _TxListState createState() => _TxListState();
}

class _TxListState extends State<TxList> {
  final List<Transaction> transactions = [
    Transaction(id: '1', price: 09.99, title: 'Item 01', date: DateTime.now()),
    Transaction(id: '2', price: 12.99, title: 'Item 02', date: DateTime.now()),
    Transaction(id: '3', price: 29.99, title: 'Item 03', date: DateTime.now()),
    Transaction(id: '4', price: 03.99, title: 'Item 04', date: DateTime.now())
  ];

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
