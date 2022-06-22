import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:yarrow/Hexagram.dart';
import 'Analysis.dart';
import 'AllList.dart';
import 'HexDetail.dart';

class Searching extends StatefulWidget {
  @override
  _Searching createState() => _Searching();
}

class _Searching extends State<Searching> {
  var hexList = [8, 7, 8, 7, 8, 7];
  int index = 0;
  var selection = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText = "";

  void transformToList() {
    var newList = [0, 0, 0, 0, 0, 0];
    if (selection[0] == 0) {
      newList[0] = 0;
      newList[1] = 0;
      newList[2] = 0;
    } else if (selection[0] == 1) {
      newList[0] = 0;
      newList[1] = 0;
      newList[2] = 1;
    } else if (selection[0] == 2) {
      newList[0] = 0;
      newList[1] = 1;
      newList[2] = 0;
    } else if (selection[0] == 3) {
      newList[0] = 0;
      newList[1] = 1;
      newList[2] = 1;
    } else if (selection[0] == 4) {
      newList[0] = 1;
      newList[1] = 0;
      newList[2] = 0;
    } else if (selection[0] == 5) {
      newList[0] = 1;
      newList[1] = 0;
      newList[2] = 1;
    } else if (selection[0] == 6) {
      newList[0] = 1;
      newList[1] = 1;
      newList[2] = 0;
    } else {
      newList[0] = 1;
      newList[1] = 1;
      newList[2] = 1;
    }
    if (selection[1] == 0) {
      newList[3] = 0;
      newList[4] = 0;
      newList[5] = 0;
    } else if (selection[1] == 1) {
      newList[3] = 0;
      newList[4] = 0;
      newList[5] = 1;
    } else if (selection[1] == 2) {
      newList[3] = 0;
      newList[4] = 1;
      newList[5] = 0;
    } else if (selection[1] == 3) {
      newList[3] = 0;
      newList[4] = 1;
      newList[5] = 1;
    } else if (selection[1] == 4) {
      newList[3] = 1;
      newList[4] = 0;
      newList[5] = 0;
    } else if (selection[1] == 5) {
      newList[3] = 1;
      newList[4] = 0;
      newList[5] = 1;
    } else if (selection[1] == 6) {
      newList[3] = 1;
      newList[4] = 1;
      newList[5] = 0;
    } else {
      newList[3] = 1;
      newList[4] = 1;
      newList[5] = 1;
    }
    setState(() {
      hexList = newList;
      print(hexList);
      index = getIndexOfHexDetail(hexList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 10),
                child: Hexagram(hexList),
              ),
              onTap: () {
                showPickerIcons(context);
              },
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 10),
              child: RawMaterialButton(
                onPressed: hexList[0] != 1 && hexList[0] != 0
                    ? () {
                        // print(hexList);
                        // print(hexList[0] == 1 || hexList[0] == 0);
                        // print(hexList[0] != 1 || hexList[0] != 0);
                      }
                    : () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HexDetail(
                                    AllList.hexagramNumList[index], index),
                              )),
                        },
                elevation: 2.0,
                fillColor: hexList[0] != 1 && hexList[0] != 0
                    ? Colors.black12
                    : Colors.black87,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 100.0,
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                hexList[0] != 1 && hexList[0] != 0
                    ? 'Select a hexagram first'
                    : 'Press it to search',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  showPickerIcons(BuildContext context) {
    Picker picker = Picker(
      adapter: PickerDataAdapter(data: [
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.dark_mode),
              Icon(Icons.dark_mode),
              Icon(Icons.dark_mode),
            ],
          ),
          value: 0,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.dark_mode),
              Icon(Icons.dark_mode),
              Icon(Icons.light_mode),
            ],
          ),
          value: 1,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.dark_mode),
              Icon(Icons.light_mode),
              Icon(Icons.dark_mode),
            ],
          ),
          value: 2,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.dark_mode),
              Icon(Icons.light_mode),
              Icon(Icons.light_mode),
            ],
          ),
          value: 3,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.light_mode),
              Icon(Icons.dark_mode),
              Icon(Icons.dark_mode),
            ],
          ),
          value: 4,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.light_mode),
              Icon(Icons.dark_mode),
              Icon(Icons.light_mode),
            ],
          ),
          value: 5,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.light_mode),
              Icon(Icons.light_mode),
              Icon(Icons.dark_mode),
            ],
          ),
          value: 6,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
        PickerItem(
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.light_mode),
              Icon(Icons.light_mode),
              Icon(Icons.light_mode),
            ],
          ),
          value: 7,
          children: [
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 0,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 1,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 2,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 3,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 4,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 5,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.dark_mode),
                ],
              ),
              value: 6,
            ),
            PickerItem(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                  Icon(Icons.light_mode),
                ],
              ),
              value: 7,
            ),
          ],
        ),
      ]),
      title: Text("Select Icon"),
      selectedTextStyle: TextStyle(color: Colors.blue, fontSize: 12),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        selection = picker.getSelectedValues();
        transformToList();
      },
    );
    picker.showModal(context);
  }
}
