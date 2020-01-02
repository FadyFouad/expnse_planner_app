import 'package:expnse_planner_app/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart.dart';

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
    Transaction(id: '1', price: 09.99, title: 'Item 01', date: DateTime.now()),
    Transaction(id: '2', price: 12.99, title: 'Item 02', date: DateTime.now()),
    Transaction(id: '3', price: 29.99, title: 'Item 03', date: DateTime.now()),
    Transaction(id: '4', price: 03.99, title: 'Item 04', date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Chart(),
            Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'price'),
                    ),
                    FlatButton(
                      child: Text('Add'),
                      onPressed: () {
                        var title = '';
                      },
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(0),
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${DateFormat().add_yMMMd().format(
                                        transaction.date)}',
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
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
