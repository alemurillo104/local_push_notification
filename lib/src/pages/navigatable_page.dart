
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigatablePage extends StatelessWidget {

  String payload;

  NavigatablePage({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Navigatable Page'),
      ),
      body: Center(
        child: Text(payload)
      ),
    );
  }
}