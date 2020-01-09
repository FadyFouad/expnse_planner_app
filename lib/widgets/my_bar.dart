import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 09-Jan-20 at 14:29.***
///***************************************************/

class Bar extends StatelessWidget {
  final String lable;
  final double spendMoney;
  final double spendPercentage;

  const Bar({Key key, this.lable, this.spendMoney, this.spendPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        fit: FlexFit.tight,
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
              child: FittedBox(
                child: Text('\$${spendMoney.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 50,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(lable),
          ],
        ),
      ),
    );
  }
}
