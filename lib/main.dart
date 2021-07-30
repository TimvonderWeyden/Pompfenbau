import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'crypto_data.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  var cryptoData = CryptoData.getData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
// scrollDirection: Axis.horizontal,
                        itemCount: cryptoData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 220,
                            width: double.maxFinite,
                            child: Card(
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 2.0,
                                        ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Stack(children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 5),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      cryptoIcon(cryptoData[index]),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      cryptoNameSymbol(cryptoData[index]),
                                                      Spacer(),
                                                      cryptoChange(cryptoData[index]),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      changeIcon(cryptoData[index]),
                                                      SizedBox(
                                                        width: 20,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      cryptoAmount(cryptoData[index])
                                                    ],
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )));
  }
  Widget cryptoIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            data['icon'],
            color: data['iconColor'],
            size: 40,
          )),
    );
  }
  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['symbol']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  Widget cryptoChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['change']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['changeValue']}',
                style: TextStyle(
                    color: data['changeColor'],
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  Widget changeIcon(data) {
    return Align(
        alignment: Alignment.topRight,
        child: data['change'].contains('-')
        ? Icon(
      Icons.star,
      color: data['changeColor'],
      size: 30,
    )
        : Icon(
          Icons.star_border,
      color: data['changeColor'],
      size: 30,
    ));
  }
  Widget cryptoAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n${data['value']}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n0.1349',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoData {
  static final getData = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'icon': Icons.star,
      'iconColor': Colors.orange,
      'change': '+3.67%',
      'changeValue': '+202.835',
      'changeColor': Colors.green,
      'value': '\$12.279',
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'icon': Icons.star_border,
      'iconColor': Colors.black,
      'change': '+5.2%',
      'changeValue': '25.567',
      'changeColor': Colors.green,
      'value': '\$7.809'
    },
  ];
}

/*
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

 */




