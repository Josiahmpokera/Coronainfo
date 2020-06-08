import 'package:coronainfo/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'dart:convert';
import 'data.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import './side_bar/kujikinga.dart';
import './side_bar/dalili.dart';
import './side_bar/dharura.dart';
import './side_bar/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


List<String> names = ['Tanzania', 'USA', 'England', 'China', 'Kenya', 'Iran', 'Italy'];

class _HomeState extends State<Home> {

  Future<List<Corona>>_getUsers() async {
    var data = await http.get('https://coronavirus-19-api.herokuapp.com/countries');
    // Convert the Data into a JSON Object
    var jsonData = json.decode(data.body);

    List<Corona> users = [];
    for(var u in jsonData){
      Corona  corona = Corona(u["country"], u["todayCases"], u["cases"], u["recovered"], u["deaths"]);
    users.add(corona);
    }
    print(users.length);
    return users;
  }

  //The List Tile Days here
  List<String> action = [
    "Jinsi ya Kujikinga",
    "Dalili za Ugonjwa",
    "Takwimu",
    "Dharura"
  ];

  @override
  Widget build(BuildContext context) {

    var theText = TextStyle(color: Colors.blueGrey, fontSize: 50, fontWeight: FontWeight.bold);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: NewDrawer(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: <Widget>[
              Text('Corona', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              Text('Info', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),),
              Image.asset('assets/new-corona.png', scale: 2.1,),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: (){
               // showSearch(context: context, delegate: DataSearch());
              },
            ),
            IconButton(
              icon: Icon(Icons.assessment, color: Colors.black,),
              onPressed: (){
                //make the New Page for New Data for Tanzania
              },
            ),
          ],

          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.grey[200],
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        Container(
                          child: Text("Tafadhali Subiri..."),
                        ),
                      ]
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {

                    if(snapshot.data[index].country == "Tanzania"){
                      Container(
                       child: Text("hello Tanzinia"),
                      );
                    }

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => MorePage(snapshot.data[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey[100],
                              offset: Offset(1, 3),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(DateTime.now().toString(),
                                  style: TextStyle(color: Colors.grey),),
                              ),
                            ),

                            //The main Circular Image Start Here
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: IconButton(icon: Icon(Icons.location_on, color: Colors.brown, size: 34,),)
                                      ),
                                      Container(
                                        child: Text(snapshot.data[index].country,
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                      ),
                                      SizedBox(width: 20,),
                                      Container(
                                        child: Text('Kesi Mpya:',
                                          style: TextStyle(color: Colors.grey),),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data[index].todayCases.toString(),
                                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //The Second Row here in Right ==>> ==>>
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Text("Kesi",
                                      style: TextStyle(color: Colors.grey),),
                                    SizedBox(width: 3,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(snapshot.data[index].deaths.toString(),
                                          style: TextStyle(color: Colors.blueGrey,
                                              fontSize: 15, fontWeight: FontWeight.bold,),),
                                      ),
                                    ),

                                    //Recovery COntainer here ==> ==>

                                    Text("Walio pona",
                                      style: TextStyle(color: Colors.grey),),
                                    SizedBox(width: 3,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Text(
                                          snapshot.data[index].recovered.toString(),
                                          style: TextStyle(color: Colors.green[800],
                                              fontSize: 15, fontWeight: FontWeight.bold),),
                                      ),
                                    ),


                                    Text("Vifo",
                                      style: TextStyle(color: Colors.grey),),
                                    SizedBox(width: 3,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.red[400],
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Text(snapshot.data[index].cases.toString(),
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 15),),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}



//The Searching Class here

class DataSearch extends SearchDelegate<String>{

  final Corona corona;

  DataSearch(this.corona);

  final city = [
    "Tanzania",
    "Kenya",
    "Uganda",
    "Italy",
    "Rwanda",
    "Burundi",
  ];

  final recent = [
    "Tanzania",
    "Kenya",
    "Uganda",
    "Italy",
    "Rwanda",
    "Burundi",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){},),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,),
      onPressed: (){},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recent:corona.country;

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.location_on),
      title: Text(corona.country),
    ),
    itemCount: suggestionList.toString().length,
    );
  }

}



class MorePage extends StatelessWidget {

  final Corona corona;

  MorePage(this.corona);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         iconTheme: IconThemeData(color: Colors.black),
         backgroundColor: Colors.white,
         title: Text(corona.country, style: TextStyle(color: Colors.black),),
       ),
       body: ListView(
         children: <Widget>[
           Container(
               alignment: Alignment.center,
               width: double.infinity,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 50,
                   width: 50,
                   child: Image.asset('assets/new-corona.png'),
                 ),
               )
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text("Covid-19", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
             ],
           ),
           SizedBox(
             height: 20,
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
             height: 40,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(2),
               color: Colors.white,
             ),
             child: Container(
               child: Row(
                 children: <Widget>[
                   SizedBox(width: 10),
                   Text("Leo: ", style: TextStyle(fontSize: 18, color: Colors.grey),),
                   SizedBox(width: 10),
                   Text(corona.todayCases.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                 ],
               ),
             ),
           ),

           Container(
             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
             child: Row(
               children: <Widget>[
                 SizedBox(width: 10),
                 Text("Kesi: ", style: TextStyle(fontSize: 18, color: Colors.grey),),
                 SizedBox(width: 10),
                 Text(corona.deaths.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
               ],
             ),
           ),


           Container(
             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
             height: 40,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(2),
               color: Colors.white,
             ),
             child: Container(
               child: Row(
                 children: <Widget>[
                   SizedBox(width: 10),
                   Text("Walio pona: ", style: TextStyle(fontSize: 18, color: Colors.grey),),
                   SizedBox(width: 10),
                   Text(corona.recovered.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),),
                 ],
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
             child: Row(
               children: <Widget>[
                 SizedBox(width: 10),
                 Text("Vifo: ", style: TextStyle(fontSize: 18, color: Colors.grey),),
                 SizedBox(width: 10),
                 Text(corona.cases.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
               ],
             ),
           ),

           Container(
             child: Column(
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(left: 15, top: 30),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                       Icon(Icons.warning, color: Colors.orange,),
                       SizedBox(
                           width: 10
                       ),
                       Text("Corona ni Hatari", style: TextStyle(fontSize: 20),),
                     ],
                   ),
                 )
               ],
             ),
           ),
         ],
       ),
     );
  }
}
