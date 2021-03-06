import 'package:expnse_planner_app/transaction.dart';
import 'package:expnse_planner_app/widgets/add_new_tx.dart';
import 'package:expnse_planner_app/widgets/chart.dart';
import 'package:expnse_planner_app/widgets/tx_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.pinkAccent,
        fontFamily: 'Cour',
//        appBarTheme: AppBarTheme()
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
            onPressed: () => showAddNewTxSheet(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(
              transactions: transactions,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Container(
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  child: TxList(
                    transactions: transactions,
                    delTransactions: _deleteTx,
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

  final List<Transaction> transactions = [];

  void _addTx(String title, double price, DateTime dateTime) {
    setState(() {
      transactions.add(
        Transaction(
          id: '$DateTime.now())',
          title: title,
          price: price,
          date: dateTime,
        ),
      );

      Navigator.of(context).pop();
    });
  }

  void _deleteTx(String id) {
    setState(() {
      transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  List<Transaction> get recentTx {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
}
