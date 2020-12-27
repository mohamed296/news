import 'package:flutter/material.dart';

class BackGrond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      color: Theme.of(context).primaryColor,
    );
  }
}
