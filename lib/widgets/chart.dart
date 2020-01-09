import 'package:expnse_planner_app/transaction.dart';
import 'package:expnse_planner_app/widgets/my_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///****************************************************
///*** Created by Fady Fouad on 02-Jan-20 at 14:09.***
///***************************************************/

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  const Chart({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('\n$transactionGroup');
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionGroup.map((tx) {
            double spendPercentage =
            totalWeekSpendding == 0 ? 0 : (tx['amount'] as double) /
                totalWeekSpendding;
            return Bar(
              spendMoney: tx['amount'],
              spendPercentage: spendPercentage,
              lable: tx['day'],
            );
          }).toList(),
        ),
      ),
      elevation: 5,
      margin: EdgeInsets.all(8),
    );
  }

  double get totalWeekSpendding {
    return transactionGroup.fold(0.0, (sum, daySpending) {
      return sum += daySpending['amount'];
    });
  }

  List<Map<String, Object>> get transactionGroup {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sum = 0;
      for (var i = 0; i < transactions.length; i++) {
        // ignore: unrelated_type_equality_checks
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          sum += transactions[i].price;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': sum};
    });
  }
}
