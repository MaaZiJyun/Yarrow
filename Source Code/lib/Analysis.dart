import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarrow/main.dart';
import 'HexDetail.dart';
import 'Hexagram.dart';
import 'AllList.dart';

class Analysis extends StatelessWidget {
  final List<int> hexList;
  final List<int> oppoHexList;
  // final int numOfChangeHex;
  final String method;

  Analysis(this.hexList, this.oppoHexList, this.method);

  int toNum(var anyList) {
    print(anyList);
    var newHexListNum = [0, 0, 0, 0, 0, 0];
    for (int i = 0; i < 6; i++) {
      if (anyList[i] != 1 || anyList[i] != 0) {
        if (anyList[i] == 6 || anyList[i] == 8) {
          newHexListNum[i] = 0;
        } else {
          newHexListNum[i] = 1;
        }
      }
    }
    // print(newHexListNum);
    return getIndexOfHexDetail(newHexListNum);
  }

  int getIndexOfHexDetail(var numList) {
    int index = 0;
    for (var i = 0; i < AllList.hexagramNumList.length; i++) {
      if (numList.toString() == AllList.hexagramNumList[i]['Num'].toString()) {
        index = i;
      }
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hexagram Analysis"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GestureDetector(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(40, 60, 40, 0),
                      child: Text('The Original Hexagrams'),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 60),
                      child: Hexagram(hexList),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HexDetail(
                        AllList.hexagramNumList[toNum(hexList)],
                        toNum(hexList))),
              );
            },
          ),
          GestureDetector(
            child: Card(
              // color: Colors.black38,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: GestureDetector(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(40, 60, 40, 0),
                      child: Text(
                        'The Changed Hexagrams',
                        style: TextStyle(
                            // color: Colors.black87,
                            ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 60),
                      child: Hexagram(oppoHexList),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HexDetail(
                        AllList.hexagramNumList[toNum(oppoHexList)],
                        toNum(oppoHexList))),
              );
            },
          ),
          Card(
              // alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              color: Colors.black45,
              child: Container(
                height: 190,
                margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Situation Classifying',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        method,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            height: 40,
            alignment: Alignment.center,
            color: Colors.black12,
            child: Text(
              'Author: Domuki && version: ^1.0.0',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
