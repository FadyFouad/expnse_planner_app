import 'package:expnse_planner_app/transaction.dart';
import 'package:expnse_planner_app/widgets/add_new_tx.dart';
import 'package:expnse_planner_app/widgets/tx_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(0),
                  child: TxList(
                    transactions: transactions,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => showAddNewTxSheet(context)),
    );
  }

  void showAddNewTxSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTx(
            addTx: _addTx,
          );
        });
  }

  final transactions = [
    Transaction(id: '1', price: 09.99, title: 'Item 01', date: DateTime.now()),
  ];

  void _addTx(String title, double price) {
    setState(() {
      transactions.add(
        Transaction(
          id: 'id',
          title: title,
          price: price,
          date: DateTime.now(),
        ),
      );

      Navigator.of(context).pop();
    });
  }
}
