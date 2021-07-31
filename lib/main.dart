import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  var pompfenData = PompfenData.getData;

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
                      itemCount: pompfenData.length,
                      itemBuilder: (context, index) =>
                          _buildCard(pompfenData[index]),
                    ),
                  ),
                ],
              ),
            )));
  }
  Widget _buildCard(data){
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(data['name']),
            subtitle: Text(data['size']),
          ),
          Image.asset(data['image'])
        ],
      ),
    );
  }
}

class PompfenData {
  static final getData = [
    {
      'name': 'Q-Tip',
      'size': '2000 mm',
      'image': 'assets/images/Q-tip.png',
    },
    {
      'name': 'Stab',
      'size': '1800 mm',
      'image': 'assets/images/Stab.png',
    },
    {
      'name': 'Langpompfe',
      'size': '1400 mm',
      'image': 'assets/images/Langpompfe.png',
    },
    {
      'name': 'Kurzpompfe',
      'size': '850 mm',
      'image': 'assets/images/Kurzpompfe.png',
    },
    {
      'name': 'Schild',
      'size': '600 mm',
      'image': 'assets/images/Schild.png',
    },
    {
      'name': 'Kette',
      'size': '3200 mm',
      'image': 'assets/images/Kette.png',
    },
  ];
}
