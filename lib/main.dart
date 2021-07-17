import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Random rand = Random();

  int next(int min, int max) {
    return min + rand.nextInt(max - min);
  }

  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Test task'),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            color = Color.fromRGBO(next(0, 255), next(0, 255), next(0, 255), rand.nextDouble());
          });
        },
        child: Center(
          child: Text(
              'Hey there',
              style: TextStyle(
                fontSize: 30
              ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Created by Lahoda Ivan', style: TextStyle(
                fontSize: 20,
                fontFamily: 'ClassicaOne'
              ),),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close')
                )
              ],
            );
          });
        },
        child: Icon(
          Icons.info_rounded,
          color: Colors.white,
        ),
    ),
    );
  }
}



