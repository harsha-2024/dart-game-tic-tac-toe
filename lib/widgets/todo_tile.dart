import 'package:flutter/material.dart';
import '../models/todo.dart';
class TodoTile extends StatelessWidget {
  final Todo todo; final Function(bool?) onChanged; final VoidCallback onDelete;
  const TodoTile({super.key, required this.todo, required this.onChanged, required this.onDelete});
  @override Widget build(BuildContext context){return Card(child: ListTile(leading: Checkbox(value: todo.isCompleted,onChanged:onChanged),title: Text(todo.title,style: TextStyle(decoration: todo.isCompleted?TextDecoration.lineThrough:TextDecoration.none)),trailing: IconButton(icon: const Icon(Icons.delete,color: Colors.red),onPressed:onDelete)));}
}
