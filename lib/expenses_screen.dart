import 'package:expense_tracker/bottom_modal.dart';
import 'package:expense_tracker/expense_card.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomModal();
              },
            );
          },
          icon: Icon(Icons.add),
        )
      ]),
      body: ExpenseCard(),
    );
  }
}
