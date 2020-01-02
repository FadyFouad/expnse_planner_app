import 'package:flutter/material.dart';

///****************************************************
///*** Created by Fady Fouad on 02-Jan-20 at 14:09.***
///***************************************************/

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
