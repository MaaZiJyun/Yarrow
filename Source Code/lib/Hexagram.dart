import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hexagram extends StatelessWidget {
  var hexList;
  Hexagram(this.hexList);

  Widget buildGrid() {
    List<Widget> tiles = [];
    Row content;
    for (var i = 0; i < 6; i++) {
      if (hexList[i] == 1 || hexList[i] == 0) {
        tiles.add(
          new Icon(
            hexList[i] % 2 != 0 ? Icons.light_mode : Icons.dark_mode,
            color: hexList[i] == 1 ? Colors.amber : Colors.indigoAccent,
            size: 50,
          ),
        );
      } else {
        tiles.add(
          new Icon(
            hexList[i] % 2 != 0 ? Icons.light_mode : Icons.dark_mode,
            color: hexList[i] == 6 || hexList[i] == 9
                ? Colors.black
                : Colors.black26,
            size: 50,
          ),
        );
      }
    }
    content = new Row(
      children: tiles,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildGrid(),
        ],
      ),
    );
  }
}
