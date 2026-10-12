import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_tile.dart';
class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState()=>_HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen>{
 final List<Todo> todos=[]; final TextEditingController controller=TextEditingController();
 void addTodo(){ if(controller.text.trim().isEmpty) return; setState(()=>todos.add(Todo(title: controller.text.trim()))); controller.clear(); }
 void deleteTodo(int i){ setState(()=>todos.removeAt(i)); }
 void toggleTodo(int i){ setState(()=>todos[i].isCompleted=!todos[i].isCompleted); }
 @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: const Text('Todo App')),body: Column(children:[Padding(padding: const EdgeInsets.all(12),child: Row(children:[Expanded(child: TextField(controller: controller,decoration: const InputDecoration(hintText:'Enter Task',border: OutlineInputBorder()))),const SizedBox(width:10),ElevatedButton(onPressed:addTodo,child: const Text('Add'))])),Expanded(child: ListView.builder(itemCount: todos.length,itemBuilder:(c,i)=>TodoTile(todo: todos[i],onChanged: (_)=>toggleTodo(i),onDelete: ()=>deleteTodo(i))))])); }
}
