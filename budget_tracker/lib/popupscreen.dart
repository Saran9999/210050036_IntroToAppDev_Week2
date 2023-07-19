import 'dart:ffi';

import 'package:budget_tracker/budget.dart';
import 'package:flutter/material.dart';
import 'budget.dart';
import 'home.dart';
import 'itemlist.dart';

class ExpenseScreen extends StatefulWidget {
  List<int> amount;
  List<Budget> items;
  ExpenseScreen({required this.amount, required this.items});
  @override
  _ExpenseScreenState createState() =>
      _ExpenseScreenState(amount: amount, items: items);
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  String expenseValue = '';
  int description = -1;
  List<int> amount;
  List<Budget> items;
  _ExpenseScreenState({required this.amount, required this.items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding New Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  expenseValue = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Category',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  description = int.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Expence with -ve and income with +ve signs',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  amount[0] = amount[0] + description;
                  items.add(Budget(amount: description, item: expenseValue));
                });

                // For example, save the expense to a data source
                Navigator.pop(
                    context,
                    val(
                        amount: amount,
                        items: items)); // Return to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
