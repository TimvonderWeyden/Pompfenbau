import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Pompfenbauanleitung'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /*
  Widget _buildListBody() {
    var team = [
      "Q-Tip",
      "Stab",
      "Langpompfe",
      "Kurzpompfe",
      "Schild",
      "Kette"
    ];
    print(team.length);
    return ListView(
      children: <Widget>[
        for (int i=0; i<=team.length-1;i++)
          _buildRow(i+1, team[i])
      ],
    );
  }
*/


  Widget _buildListBody() {
    return SizedBox(
      child: Card(
        child: Column(
          children: [
            _buildCard("Q-tip", "2000 mm", 'assets/images/Q-tip.png'),
            _buildCard("Stab","1800 mm", 'assets/images/Q-tip.png'),
            _buildCard("Langpompfe", "1400 mm", 'assets/images/Q-tip.png'),
            _buildCard("Kurzpompfe", "850 mm", 'assets/images/Q-tip.png'),
            _buildCard("Schild", "600 mm", 'assets/images/Schild.png'),
            _buildCard("Kette", "3200 mm", 'assets/images/Q-tip.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String pompfe, String groesse, String image){
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(pompfe),
            subtitle: Text(groesse),
          ),
          Image.asset(image)
        ],
      ),
    );
  }

/*
  Widget _buildCard(String pompfe){
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Text(pompfe)
          ],
        ),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildListBody(),
    );


  }
}





