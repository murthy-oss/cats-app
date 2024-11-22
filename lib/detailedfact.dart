import 'package:flutter/material.dart';

class Detailedfact extends StatelessWidget {
  String result;
   Detailedfact(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Detailed view"),
      ),
      body: Center(
        child: Text(
          result
          
        ),
      ),
    );
  }
}