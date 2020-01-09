import 'package:flutter/cupertino.dart';
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
    return Container(
      height: 400,
      padding: EdgeInsets.all(4),
      child: transactions.isEmpty
          ? Image.asset(
        'assets/images/waiting.png',
        fit: BoxFit.fill,
      )
          : ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      ' ${transactions[index].price.toStringAsFixed(2)} \$',
                      style: (TextStyle(
                        fontSize: 20,
                        fontFamily: 'FFTaweel',
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .textSelectionColor,
                      )),
                    ),
                  ),
                ),
              ),
              title: Text(
                '${transactions[index].title}',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${DateFormat().add_yMMMd().format(transactions[index]
                    .date)}',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
//            Card(
//            margin: EdgeInsets.all(8),
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Column(
//                    children: <Widget>[
//                      Text(
//                        '${transactions[index].title}',
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontWeight: FontWeight.bold),
//                      ),
//                      Text(
//                        '${DateFormat().add_yMMMd().format(transactions[index]
//                            .date)}',
//                        style: TextStyle(color: Colors.grey),
//                      ),
//                    ],
//                  ),
//                  Container(
//                    child: Text(
//                      ' ${transactions[index].price.toStringAsFixed(2)} \$',
//                      style: (TextStyle(
//                        fontSize: 20,
//                        fontFamily: 'FFTaweel',
//                        color: Theme
//                            .of(context)
//                            .primaryColor,
//                      )),
//                    ),
//                    padding: EdgeInsets.all(4),
//                  ),
//                ],
//              ),
//            ),
//          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
