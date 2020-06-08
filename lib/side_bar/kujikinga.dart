import 'package:flutter/material.dart';

class PreventScreen extends StatefulWidget {
  @override
  _PreventScreenState createState() => _PreventScreenState();
}

class _PreventScreenState extends State<PreventScreen> {

  var numberStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 45);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
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
          title: Text("Jinsi ya Kujikinga", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
        ),
        body: ListView(
          children: <Widget>[

            //Number ONe
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1", style: numberStyle,),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text.rich(
                        TextSpan(
                          text: 'Nawa Mikono  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          children: <TextSpan> [
                            TextSpan(
                              text: 'Nawa Mikono angalau sekunde 20 kwa maji na sabuni.'
                                  'Tumia kitakasa Mikono chenye alikoholi (Si chini ya Asilimia 60)'
                                  'Kusafisha Mikono', style: TextStyle(fontWeight: FontWeight.w300)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/dalili/hand-wash.png'),
                  ),
                ],
              ),
            ),


            //NUmber Two

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2", style: numberStyle,),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[

                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/kujikinga/touch.png'),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text.rich(
                        TextSpan(
                          text: 'Usiguse Uso  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          children: <TextSpan> [
                            TextSpan(
                                text: 'Macho, pua na mdomo inaweza ikawa njia ya virusi kuingia'
                                    'mwilini kama virusi vitakuwa mkononi.', style: TextStyle(fontWeight: FontWeight.w300)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //NUmber Three

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("3", style: numberStyle,),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text.rich(
                        TextSpan(
                          text: 'Kaa Nyumbani  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          children: <TextSpan> [
                            TextSpan(
                                text: 'baki nyumbani kama huna sababu ya msingi inayokufanya utoke,'
                                    'Ubakipo nyumbani utakuwa salama', style: TextStyle(fontWeight: FontWeight.w300)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/kujikinga/home.png'),
                  ),

                ],
              ),
            ),

            //Four

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("4", style: numberStyle,),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/dalili/hug.png'),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text.rich(
                        TextSpan(
                          text: 'Epuka Kukumbatiana  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          children: <TextSpan> [
                            TextSpan(
                                text: 'baki nyumbani kama huna sababu ya msingi inayokufanya utoke,'
                                    'Ubakipo nyumbani utakuwa salama', style: TextStyle(fontWeight: FontWeight.w300)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
