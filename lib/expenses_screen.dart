import 'package:expense_tracker/bottom_modal.dart';
import 'package:expense_tracker/expense_card.dart';
import 'package:expense_tracker/models/expense_card_blueprint.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<ExpenseCardBlueprint> expensesList = [
    ExpenseCardBlueprint(
        title: 'Ebrahim',
        amount: 12.0,
        date: DateTime.now(),
        category: Category.leisure),
    ExpenseCardBlueprint(
        title: 'Morkas',
        amount: 12.12,
        date: DateTime.now(),
        category: Category.work),
  ];

  void addExpense(
      String title, double amount, DateTime date, Category category) {
    setState(() {
      expensesList.add(ExpenseCardBlueprint(
          title: title, amount: amount, date: date, category: category));
    });
  }

  void removeExpense(ExpenseCardBlueprint expense) {
    setState(() {
      expensesList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BottomModal(addExpense: addExpense);
              },
            );
          },
          icon: Icon(Icons.add),
        )
      ]),
      body: ExpenseCard(
        expensesList: expensesList,
        removeExpense: removeExpense,
      ),
    );
  }
}
