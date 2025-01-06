import 'package:expense_tracker/models/expense_card_blueprint.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  ExpenseCard({super.key});

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
            child: Column(
          children: [
            Text(expensesList[index].title),
            Row(
              children: [
                Text(expensesList[index].amount.toString()),
                const Spacer(),
                Row(
                  children: [
                    Text(expensesList[index].category.name),
                    Text(expensesList[index].date.toString()),
                  ],
                ),
              ],
            )
          ],
        ));
      },
      itemCount: expensesList.length,
    );
  }
}
