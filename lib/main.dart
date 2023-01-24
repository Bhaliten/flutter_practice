import 'package:flutter/material.dart';
import 'package:flutter_practice/objects/transaction.dart';
import 'package:flutter_practice/widgets/chart.dart';
import 'package:flutter_practice/widgets/new_transaction.dart';
import 'package:flutter_practice/widgets/transaction_element.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Transactions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = List.empty(growable: true);

  void _addNewTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _openNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          child: NewTransaction(
            addNewTransaction: _addNewTransaction,
          ),
        );
      },
    );
    // setState(() {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              _openNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Chart(),
            ..._transactions.map(
                (transaction) => TransactionElement(transaction: transaction))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openNewTransaction(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
