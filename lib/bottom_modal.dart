import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController titleController = TextEditingController();
  final formatter = DateFormat.yMd();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  DateTime now = DateTime.now();
  DateTime? selectedDate;
  void datePicker() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: DateTime(now.year),
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
          Text(selectedDate == null
              ? "No Date selected"
              : formatter.format(selectedDate!)),
          IconButton(onPressed: datePicker, icon: Icon(Icons.calendar_month)),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  child: Text("Submit"))
            ],
          )
        ],
      ),
    );
  }
}
