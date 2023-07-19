import 'package:flutter/material.dart';
import 'home.dart';
import 'budget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Budget> items = [Budget(amount: 50000, item: 'Salary')];
  final List<int> amount = [50000];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      home: home(total_amount: amount, items: items),
    );
  }
}
