import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'itemlist.dart';
import 'budget.dart';
import 'popupscreen.dart';

class home extends StatefulWidget {
  List<int> total_amount;
  List<Budget> items;
  home({required this.total_amount, required this.items});
  @override
  _homeState createState() => _homeState(amount: total_amount, items: items);
}

class _homeState extends State<home> {
  List<int> amount;
  List<Budget> items;
  _homeState({required this.amount, required this.items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Budget Tracker'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('images/650007.jpg'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Monkey D Luffy',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Mail ID',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'MonkeyDLuffy@meat.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(40.0), // Adjust the value as needed
                color: Colors.grey[800], // Set your desired background color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    'Total:',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    '${amount[0]}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                  ElevatedButton(
                    child: Icon(Icons.expand),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                item(total_amount: amount, items: items)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ExpenseScreen(amount: amount, items: items)),
          ).then((value) {
            setState(() {
              // Update the value of amount[0] after returning from ExpenseScreen
              amount[0] = value.amount[0];
              items = value.items;
            });
          });
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
