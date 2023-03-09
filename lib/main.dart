import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Your Diet Guide"),
      )),
      body: Container(
        height: 400.0,
        width: 250.0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 100, 40, 1),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffefaec4), Color(0xffe85788)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: new EdgeInsets.symmetric(vertical: 16.0),
                    alignment: FractionalOffset.centerLeft,
                    child: new FittedBox(
                      child: new Container(
                        height: 50,
                        width: 50,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage('assets/bread.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(80.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 3, 40, 10),
                    child: Column(
                      children: [
                        Container(
                          child: new Text(
                            "Breakfast",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 28),
                          ),
                        ),
                        Container(
                          child: new Text(
                            "Bread\n Peanut butter \n Apple",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 22),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              child: new Text(
                                "525",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: new Text(
                                "kcal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
