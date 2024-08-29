import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todocard extends StatelessWidget {
  String title;
  bool status;
  int iii;
  Function changestatu;
  Function deletfunction;
  Todocard(
      {required this.title,
      required this.iii,
      required this.status,
      required this.changestatu,
      required this.deletfunction});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changestatu(iii);
      },
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: ((context) {
              deletfunction(iii);
            }),
            
            //padding: EdgeInsets.all(10),
            icon: Icons.delete,
            padding: EdgeInsets.all(15),
            borderRadius:BorderRadius.circular(20) ,
          )
        ]),
        child: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          child: Card(
            color: Colors.deepPurple,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    status ? Icons.check_box_outline_blank : Icons.check_box,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    
                    style: TextStyle(
                      decoration: status ? TextDecoration.none :TextDecoration.lineThrough,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color:status?  Colors.white: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
