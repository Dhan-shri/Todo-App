import 'package:flutter/material.dart';
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(0xffc1789d),
        ),
      ),
      title: 'Todo App’',
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) => Text(_todoList[index]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffc1789d),
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: const Icon(Icons.today_outlined),
      ),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add todo'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Enter text here'),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
