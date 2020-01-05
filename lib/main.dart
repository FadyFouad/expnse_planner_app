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
            Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        onChanged: (sTitle) {
                          title = sTitle;
                        }),
                    TextField(
                      decoration: InputDecoration(labelText: 'price'),
                      onChanged: (sPrice) {
                        price = sPrice;
                      },
                    ),
                    FlatButton(
                      child: Text('Add'),
                      onPressed: () {
//                        transactions.add(Transaction(
//                            id: '1',
//                            title: title,
//                            price: 1.1,
//                            date: DateTime.now()));
                      },
                      textColor: Colors.purple,
                    )
                  ],
                ), //addTX
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(0),
                    child: TxList()
                ),
              ),
            ),
          ],
        ),
    );
  }
}
