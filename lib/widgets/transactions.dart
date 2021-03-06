import 'package:expnse_planner_app/widgets/add_new_tx.dart';
import 'package:expnse_planner_app/widgets/tx_list.dart';
import 'package:flutter/material.dart';

import '../transaction.dart';

///****************************************************
///*** Created by Fady Fouad on 06-Jan-20 at 21:42.***
///***************************************************/

class UserTx extends StatefulWidget {
  @override
  _UserTxState createState() => _UserTxState();
}

class _UserTxState extends State<UserTx> {
  final transaction = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTx(
          addTx: _addTx,
        ),
        TxList(
          transactions: transaction,
        )
      ],
    );
  }

  void _addTx(String title, double price) {
    setState(() {
      transaction.add(
        Transaction(
          id: 'id',
          title: title,
          price: price,
          date: DateTime.now(),
        ),
      );
    });
  }
}
