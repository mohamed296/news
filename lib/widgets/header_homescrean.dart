import 'package:flutter/material.dart';

class HeaderHomeScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Text(
        'USA News',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
