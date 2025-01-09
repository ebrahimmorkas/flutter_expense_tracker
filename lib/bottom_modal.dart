import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense_card_blueprint.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key, required this.addExpense});

  final Function(String, double, DateTime, Category) addExpense;

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void handleFormSubmit() {
    final finalAmount = double.tryParse(amountController.text);
    if (titleController.text.isEmpty ||
        finalAmount == null ||
        selectedDate == null) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields correctly.'),
        ),
      );
      return; // Exit the function if validation fails
    }
    widget.addExpense(
        titleController.text, finalAmount, selectedDate!, selectedCategory);

    Navigator.pop(context);
  }

  DateTime now = DateTime.now();
  DateTime? selectedDate;
  void datePicker() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
      currentDate: now,
    ).then((value) {
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          Row(children: [
            Flexible(
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  label: Text('Amount'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Text(selectedDate == null
                ? "No Date selected"
                : formatter.format(selectedDate!)),
            IconButton(onPressed: datePicker, icon: Icon(Icons.calendar_month)),
          ]),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      selectedCategory = value;
                    });
                  }),
              ElevatedButton(
                onPressed: handleFormSubmit,
                child: Text("Submit"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"))
            ],
          ),
        ],
      ),
    );
  }
}
