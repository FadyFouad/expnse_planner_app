import 'package:expnse_planner_app/widgets/transactions.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var title = '';
  var price = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Chart(),
//            AddTx(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(0),
                    child: UserTx()
                ),
              ),
            ),
          ],
        ),
    );
  }
}
