import 'package:flutter/material.dart';
import 'package:flutter_practice/objects/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add new transaction',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) return 'Enter a valid name!';
                return null;
              },
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                hintText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (text) {
                if (text == null || text.isEmpty)
                  return 'Enter a valid amount!';
                return null;
              },
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(8),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Process data!'),
                      ),
                    );
                    var t = Transaction(
                      name: nameController.text,
                      time: DateTime.now(),
                      amount: double.parse(amountController.text),
                    );
                    widget.addNewTransaction(t);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
