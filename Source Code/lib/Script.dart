import 'package:flutter/material.dart';

class Script extends StatelessWidget {
  // final Function selectHandler;
  var scr;
  var num;
  Script(this.scr, this.num);

  Widget buildGrid() {
    List<Widget> tiles = [];
    Widget content;
    for (var i = 5; i > -1; i--) {
      tiles.add(new Card(
        child: ListTile(
          leading: Icon(
            num[i] % 2 != 0 ? Icons.local_fire_department : Icons.ac_unit,
            size: 40,
            color: num[i] % 2 != 0 ? Colors.red[300] : Colors.blue[300],
          ),
          title: Text(
            (i + 1).toString() + ' — ' + scr[i].toString(),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ));
    }
    content = new Column(
      children: tiles,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildGrid(),
    );
  }
}
