import 'package:expense_appv2/widgets/expense_list/expenses_list.dart';
import 'package:expense_appv2/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course", 
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work
      ),
    Expense(
      title: "Cinema", 
      amount: 15.69, 
      date: DateTime.now(), 
      category: Category.leisure
      ),
  ];

  void _openAddExpenseOverlay () {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => const NewExpense(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Expense Tracker')),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses
              )
            )
        ],
      ),
    );
  }
}