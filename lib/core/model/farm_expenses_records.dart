import 'package:flutter/material.dart';

class FarmExpensesRecords {
  final String date;
  final String expensesType;
  final String amount;
  final bool isIncome;

  FarmExpensesRecords({
    @required this.date,
    @required this.expensesType,
    @required this.amount,
    @required this.isIncome,
  });
}
