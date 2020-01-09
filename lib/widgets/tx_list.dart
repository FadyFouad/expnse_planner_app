import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../transaction.dart';

///****************************************************
///*** Created by Fady Fouad on 03-Jan-20 at 00:06.***
///***************************************************/

class TxList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTransactions;

  const TxList({Key key, this.transactions, this.delTransactions})
      : super(key: key);

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
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () =>
                  delTransactions(transactions[index].id),),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
