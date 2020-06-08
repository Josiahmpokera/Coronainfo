import 'package:flutter/material.dart';
import 'package:coronainfo/data.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EastAfrica extends StatefulWidget {
  @override
  _EastAfricaState createState() => _EastAfricaState();
}

class _EastAfricaState extends State<EastAfrica> {

  List<Disease> datas  = [];
  var loading = false;

  Future<Null> _getInformation() async {
    setState(() {
      loading = true;
    });

    final getData = await http.get('https://coronavirus-19-api.herokuapp.com/countries/Tanzania');

    if(getData.statusCode == 200){
      final data = jsonDecode(getData.body);
      print(data);
      setState(() {
        for(Map i in data){
          datas.add(Disease.fromJson(i));
        }
        loading = false;
      });
      print(datas);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInformation();
  }

  
  
  @override
  Widget build(BuildContext context) {

    _getInformation();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
          title: Text("Tanzania", style: TextStyle(color: Colors.black),)
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/africa/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(14),
                width: double.infinity,
                child: Image.asset('assets/africa/corona_container.png'),
              ),
              Container(
                margin: EdgeInsets.all(14),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    //The First Words of the Line
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                height: 30,
                                width: 30,
                                child: Image.asset('assets/tanzania.png'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: DateTime.now().day.toString(),
                                  children: <TextSpan> [
                                    TextSpan(
                                        text: '-'
                                    ),
                                    TextSpan(
                                      text: DateTime.now().month.toString(),
                                    ),
                                    TextSpan(
                                        text: '-'
                                    ),
                                    TextSpan(
                                      text: DateTime.now().year.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child:  Text("Ripoti ya leo", style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 0.7,
                      color: Colors.grey,
                      width: double.infinity,
                    ),
                    //new Case of Corona Virus in the Contry
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Kesi za Corona"),
                          Text("Null Kesi", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),)
                        ],
                      ),
                    ),
                    //The Number of recovery Peoples
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Waliopona:"),
                          Text("Null", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),)
                        ],
                      ),
                    ),
                    //The Number of peoples who dies
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Walio Fariki:"),
                          Text("null", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),)
                        ],
                      ),
                    ),
                    //The Number of the Day
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Wagonjwa wapya:"),
                          Text("null", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),)
                        ],
                      ),
                    ),
                    //Wagonjwa waliopo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Wagonjwa waumwao:"),
                          Text("null", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
