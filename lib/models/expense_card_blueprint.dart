import 'package:uuid/uuid.dart';

var uuid = Uuid();

enum Category { travel, work, leisure, other }

class ExpenseCardBlueprint {
  ExpenseCardBlueprint(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String title;
  double amount;
  DateTime date;
  Category category;
  String id;
}
