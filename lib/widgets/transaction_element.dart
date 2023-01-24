import 'package:flutter/material.dart';
import 'package:flutter_practice/objects/transaction.dart';

class TransactionElement extends StatelessWidget {
  final Transaction transaction;

  const TransactionElement({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                transaction.amount.toString(),
              ),
            ],
          ),
          Column(
            children: [
              Text(transaction.name),
              Text(
                transaction.time.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
