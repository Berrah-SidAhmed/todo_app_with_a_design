import 'package:flutter/material.dart';
import 'package:flutter_application_16/widget/Todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Simpletodoapp(),
    );
  }
}

class Simpletodoapp extends StatefulWidget {
  const Simpletodoapp({super.key});

  @override
  State<Simpletodoapp> createState() => _SimpletodoappState();
}

class Todo {
  String title;
  bool status;
  Todo({required this.title, required this.status});
}

List Alltodos = [];
final myController = TextEditingController(); 

class _SimpletodoappState extends State<Simpletodoapp> {
  addtodo() {
    setState(() {
      Alltodos.add(Todo(title: myController.text, status: true));
    });
  }

  changestatu(index) {
    setState(() {
      Alltodos[index].status = !Alltodos[index].status;
    });
  }

  deletetask(int Clickedtsk) {
    setState(() {
      Alltodos.remove(Alltodos[Clickedtsk]);
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Simple Todo",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 600,
              child: ListView.builder(
                  itemCount: Alltodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      //height: 600,
                      child: Todocard(
                          deletfunction: deletetask,
                          iii: index,
                          changestatu: changestatu,
                          status: Alltodos[index].status,
                          title: Alltodos[index].title),
                    );
                  }),
            ),

            // Container(
            //   width: 300,
            //   padding: EdgeInsets.all(8),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.deepPurple.shade200,
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10))),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    hintText: "Add a new Todo Item",
                    icon: Icon(Icons.add),
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              //Navigator.pop(context);
              addtodo();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
