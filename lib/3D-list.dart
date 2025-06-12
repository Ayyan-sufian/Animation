import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listPg extends StatelessWidget{
  var indexNum = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D List'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListWheelScrollView(itemExtent: 200,
          children: indexNum.map((value) => Container(width: double.infinity,color: Colors.blue,)).toList()

          ),
    );
  }

}