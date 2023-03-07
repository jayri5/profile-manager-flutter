import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoControllername = TextEditingController();
  final _todoControlleremail = TextEditingController();
  dynamic _todoControllersource = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  String dropdownvalue = 'Facebook';

  // List of items in our dropdown menu
  var items = ['Facebook', 'Instagram', 'Organic', 'Friend', 'Google'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: tdBGColor,
        backgroundColor: Color(0xffbcbaba),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: TextField(
                controller: _todoControllername,
                decoration:
                    InputDecoration(hintText: 'name', border: InputBorder.none),
              ),
            ),
            Container(
              child: TextField(
                controller: _todoControlleremail,
                decoration: InputDecoration(
                    hintText: 'email', border: InputBorder.none),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text('Source'),
                ),
                SizedBox(width: 10),
                Container(
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              child: ElevatedButton(
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                onPressed: () {
                  _addToDoItem(_todoControllername.text,
                      _todoControlleremail.text, _todoControllersource.text);
                },
                style: ElevatedButton.styleFrom(
                  primary: tdBlue,
                  minimumSize: Size(60, 60),
                  elevation: 10,
                ),
              ),
            ),
            searchBox(),
            SizedBox(
              height: 10,
            ),
            for (ToDo todoo in _foundToDo.reversed)
              ToDoItem(
                todo: todoo,
                onToDoChanged: _handleToDoChange,
                onDeleteItem: _deleteToDoItem,
              ),
          ]),
        ));
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.name = todo.name;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.name == id);
    });
  }

  void _addToDoItem(String toDo, todo2, todo3) {
    setState(() {
      todosList.add(ToDo(
        //id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: toDo,
        email: todo2,
        source: todo3,
      ));
    });
    _todoControllername.clear();
    _todoControlleremail.clear();
    _todoControllersource.clear();
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(5, 10, 0, 0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          suffixIcon: Icon(
            Icons.task_alt_outlined,
            color: tdBlack,
            size: 20,
          ),
          //prefixIconConstraints: BoxConstraints(
          //maxHeight: 20,
          //minWidth: 25,
          //),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
              item.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.work_history_outlined,
          color: Colors.white,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/shinzo.jpg'),
          ),
        ),
      ]),
    );
  }
}
