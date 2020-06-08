import 'package:flutter/material.dart';

class Dalili extends StatefulWidget {
  @override
  _DaliliState createState() => _DaliliState();
}

class _DaliliState extends State<Dalili> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Dalili za Corona", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset('assets/dalili/dalili.jpeg'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '01. ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        children: <TextSpan> [
                          TextSpan(
                            text: 'Homa kali na kuhisi kuchoka', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '02. ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        children: <TextSpan> [
                          TextSpan(
                            text: 'Kukohoa kikohozi kikavu', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '03. ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        children: <TextSpan> [
                          TextSpan(
                            text: 'Kuwa na tatizo la kupumua', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: '04. ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        children: <TextSpan> [
                          TextSpan(
                            text: 'Kuumwa Misuli (Maumivu ya Viungo)', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //New Container
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text.rich(
                  TextSpan(
                    text: 'Inakadiriwa wagonjwa wa ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    children: <TextSpan> [
                      TextSpan(
                        text: 'Corona (Covid-19)', style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'huanza kuonyesha Dalili za ugonjwa wa Corona siku 1 '
                            'hadi 14 baada ya maambukizi. Kwa wastani dalilii hutokea siku ya 5.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
