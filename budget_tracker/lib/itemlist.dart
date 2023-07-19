import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'budget.dart';
import 'home.dart';
import 'popupscreen.dart';

class budCard extends StatelessWidget {
  final Budget budget;
  final VoidCallback delete;
  budCard({required this.budget, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[800],
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 20.0),
              Text(
                '${budget.item}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                '${budget.amount}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(width: 20.0),
              ElevatedButton.icon(
                onPressed: delete,
                label: Text('Delete'), // Changed label text to 'Delete'
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ));
  }
}

class item extends StatefulWidget {
  List<int> total_amount;
  List<Budget> items;
  item({required this.total_amount, required this.items});
  @override
  _itemState createState() => _itemState(amount: total_amount, items: items);
}

class _itemState extends State<item> {
  List<int> amount;
  List<Budget> items;
  _itemState({required this.amount, required this.items});
  // Widget budTemplate(budget) {
  //   return Card(
  //       color: Colors.grey[800],
  //       margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
  //       child: Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             SizedBox(width: 20.0),
  //             Text(
  //               '${budget.item}',
  //               style: TextStyle(
  //                 fontSize: 18.0,
  //                 color: Colors.grey[400],
  //               ),
  //             ),
  //             SizedBox(height: 6.0),
  //             Text(
  //               '${budget.amount}',
  //               style: TextStyle(
  //                 fontSize: 14.0,
  //                 color: Colors.grey[400],
  //               ),
  //             ),
  //             SizedBox(width: 20.0),
  //           ],
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      home(total_amount: amount, items: items)),
            );
          },
        ),
        // actions: [
        //   CircleAvatar(
        //     backgroundImage:
        //         AssetImage('images/650007.png'), // Replace with your image path
        //   ),
        // ],
        title: Text('Budget Tracker'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        // CircleAvatar(
        //   radius: 40.0,
        //   backgroundImage: AssetImage('images/650007.jpg'),
        // ),
        elevation: 0.0,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(40.0), // Adjust the value as needed
                color: Colors.grey[800], // Set your desired background color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50.0),
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
            Column(
              children: items
                  .map((bud) => budCard(
                      budget: bud,
                      delete: () {
                        setState(() {
                          amount[0] = amount[0] - bud.amount;
                          items.remove(bud);
                        });
                      }))
                  .toList(),
            ),
          ]),
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
