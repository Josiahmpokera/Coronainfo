import 'package:flutter/material.dart';
import 'dart:async';

void main(){
  runApp((MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MainContainer(),
      ),
    );
  }
}

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Container(
              height: 80,
              width: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.assessment, color: Colors.purple, size: 34,),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 2),
                    blurRadius: 9,
                  ),
                ]
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/loading.gif'),
            ),
          ),
          Text("Loading..", style: TextStyle(fontSize: 16, color: Colors.purple),)
        ],
      ),
    );
  }
}


