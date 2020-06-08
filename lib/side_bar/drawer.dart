import 'package:coronainfo/africa/africa.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'kujikinga.dart';
import 'dalili.dart';
import 'package:url_launcher/url_launcher.dart';




class NewDrawer extends StatefulWidget {
  @override
  _NewDrawerState createState() => _NewDrawerState();
}

class _NewDrawerState extends State<NewDrawer> {


  void _launcher(String Url) async{
    if( await canLaunch(Url)){
      await launch(Url);
    } else {
      throw 'Could not open Url';
    }
  }

  void _launcherCaller(int number) async{
    var  url = "tel:${number.toString()}";
    if( await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not open call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: <Widget> [
                Container(
                  height: 67,
                  width: 67,
                  child: Image.asset('assets/corona_logo.png'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 07),
            alignment: Alignment.topLeft,
            child: Text("Covid-19 Info", style: TextStyle(color: Colors.green[800], fontSize: 27)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,),
            alignment: Alignment.topLeft,
            child: Text("The App is Under Contruction", style: TextStyle(color: Colors.green[800], fontSize: 14)),
          ),
          //The next is The Line Horizontal
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            height: 1,
            color: Colors.green[800],
          ),

          //The List and Buttons here
          Container(
            child: Column(
              children: <Widget> [
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EastAfrica()));
                  },
                  leading: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset('assets/africa/africa.png'),
                  ),
                  title: Text("Ripoti Tanzania"),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => PreventScreen()));
                  },
                  leading: Icon(Icons.security, color: Colors.green),
                  title: Text("Jinsi ya Kujikinga"),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => Dalili()));
                  },
                  leading: Icon(Icons.local_hospital, color: Colors.red),
                  title: Text("Dalili za Ugonjwa"),
                ),
                ListTile(
                  onTap: (){
                    //Make a Call
                  _launcherCaller(08001100124);
                  },
                  leading: Icon(Icons.phone, color: Colors.grey,),
                  title: Text("Huduma ya Dharura"),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutApp()));
                  },
                  leading: Icon(Icons.help_outline),
                  title: Text("About"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
