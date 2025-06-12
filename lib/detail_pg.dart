import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detailPg extends StatelessWidget{
  const detailPg({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Detail'),
      centerTitle: true,
    ),
    body: Container(
      child: Hero(tag: 'background',
          child: Image.asset('assets/images/rolls-royce.jpg')),

    ),
  );
  }
}