import 'package:expnse_planner_app/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', amount: 9.99, title: 'Ball', date: DateTime.now()),
    Transaction(id: '2', amount: 12.99, title: 'Ball', date: DateTime.now()),
    Transaction(id: '3', amount: 29.99, title: 'Ball', date: DateTime.now()),
    Transaction(id: '4', amount: 3.99, title: 'Ball', date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Chart !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              elevation: 3,
              margin: EdgeInsets.all(8),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: transactions.map((transaction) {
                    return Card(
                      child: Text(transaction.title),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ));
  }
}
