import 'package:expense_tracker/expenses_screen.dart';
import 'package:expense_tracker/models/expense_card_blueprint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatefulWidget {
  ExpenseCard(
      {super.key, required this.expensesList, required this.removeExpense});
  final List<ExpenseCardBlueprint> expensesList;
  final Function(ExpenseCardBlueprint) removeExpense;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  final formatter = DateFormat.yMd();
  // List<ExpenseCardBlueprint> expensesList = [
  //   ExpenseCardBlueprint(
  //       title: 'Ebrahim',
  //       amount: 12.0,
  //       date: DateTime.now(),
  //       category: Category.leisure),
  //   ExpenseCardBlueprint(
  //       title: 'Morkas',
  //       amount: 12.12,
  //       date: DateTime.now(),
  //       category: Category.work),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(widget.expensesList[index].id),
            onDismissed: (direction) {
              widget.removeExpense(widget.expensesList[index]);
            },
            child: Card(
                child: Column(
              children: [
                Text(widget.expensesList[index].title),
                Row(
                  children: [
                    Text(widget.expensesList[index].amount.toString()),
                    const Spacer(),
                    Row(
                      children: [
                        Text(widget.expensesList[index].category.name),
                        Text(widget.expensesList[index].date.toString()),
                      ],
                    ),
                  ],
                )
              ],
            )));
      },
      itemCount: widget.expensesList.length,
    );
  }
}

// class ExpenseCard extends StatelessWidget {
//   final formatter = DateFormat.yMd();

//   ExpenseCard({super.key});

//   List<ExpenseCardBlueprint> expensesList = [
//     ExpenseCardBlueprint(
//         title: 'Ebrahim',
//         amount: 12.0,
//         date: DateTime.now(),
//         category: Category.leisure),
//     ExpenseCardBlueprint(
//         title: 'Morkas',
//         amount: 12.12,
//         date: DateTime.now(),
//         category: Category.work),
//   ];

//   void addExpense(
//       String title, double amount, DateTime date, Category category) {
//     ExpenseCardBlueprint(
//         title: title,
//         amount: amount,
//         date: date,
//         category: category,
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return Card(
//             child: Column(
//           children: [
//             Text(expensesList[index].title),
//             Row(
//               children: [
//                 Text(expensesList[index].amount.toString()),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Text(expensesList[index].category.name),
//                     Text(expensesList[index].date.toString()),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ));
//       },
//       itemCount: expensesList.length,
//     );
//   }
// }
