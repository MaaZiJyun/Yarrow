import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Hexagram.dart';
import 'Script.dart';

class HexDetail extends StatelessWidget {
  final Map<String, Object> detail;
  int index;
  HexDetail(this.detail, this.index);

  // Widget returnAll() {
  //   if (detail['All'] != '') {
  //     return new Card(
  //       child: ListTile(
  //         leading: Icon(
  //           Icons.eco,
  //           size: 40,
  //           color: Colors.green[300],
  //         ),
  //         title: Text(
  //           detail['All'].toString(),
  //           style: TextStyle(
  //             fontSize: 15,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return new Card(
  //       child: ListTile(
  //         leading: Icon(
  //           Icons.eco,
  //           size: 40,
  //           color: Colors.orange[300],
  //         ),
  //         title: Text(
  //           'There\'s no record of this part',
  //           style: TextStyle(
  //             fontSize: 15,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail['Name'] as String),
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: Hexagram(detail['Num']),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Column(
                    children: [
                      Text(
                        detail['Name'].toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Text(
                detail['Intro'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.flag_sharp,
                color: Colors.red,
                size: 30,
              ),
              title: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'index',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.pest_control,
                color: Colors.orange,
                size: 30,
              ),
              title: Text(
                detail['Compare'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Compare',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.grade,
                color: Colors.amber,
                size: 30,
              ),
              title: Text(
                detail['Feature'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Feature',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.eco,
                color: Colors.green,
                size: 30,
              ),
              title: Text(
                detail['Symbol'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Symbol',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.book,
                color: Colors.blue,
                size: 30,
              ),
              title: Text(
                detail['Word'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Word',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.tag_faces_rounded,
                color: Colors.deepPurple,
                size: 30,
              ),
              title: Text(
                detail['Evaluation'].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Evaluation',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
