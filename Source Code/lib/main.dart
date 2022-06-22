import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:yarrow/AllList.dart';
import 'package:yarrow/Analysis.dart';
import 'package:yarrow/Searching.dart';

import 'Hexagram.dart';

void main() => runApp(MyApp());

var hexListNum = [1, 0, 1, 0, 1, 0];
var hexList = [8, 7, 8, 7, 8, 7]; //
var oppoHexList = [1, 0, 1, 0, 1, 0];
int numOfChangeHex = 0;
String method = '';
bool isButtonValid = true;
late Timer countDownTimer;
late int seconds;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yarrow',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.bolt,
                  color: Colors.black,
                  size: 30,
                )),
                Tab(
                    icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                )),
                Tab(
                    icon: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.black,
                  size: 30,
                )),
              ],
            ),
            title: const Text(
              'ＹＡＲＲＯＷ',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Yarrow(),
              Searching(),
              AllList(),
              // Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class Yarrow extends StatefulWidget {
  @override
  State createState() => _Yarrow();
}

class _Yarrow extends State<Yarrow> with AutomaticKeepAliveClientMixin {
//variables and methods
  final int BEGINNING = 49;
  int randomNum = 0;

  int collection = 0;
  int totalReminder = 0;

  @override
  void initState() {
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      cancelTimer();
    });
    super.initState();
  }

  int getChange(int value) {
    int remainder = 0;
    int left = 0;
    int right = 0;

    Random r = Random();
    left = r.nextInt(value);
    right = value - left;

    right--;
    remainder++;

    if (left % 4 != 0) {
      remainder += left % 4;
    } else {
      remainder += 4;
    }

    if (right % 4 != 0) {
      remainder += right % 4;
    } else {
      remainder += 4;
    }

    totalReminder += remainder;
    return (value - remainder);
  }

  int getHexagram(double num) {
    // print('------------');
    // print(num);
    if (num == 6) {
      return 6;
    } else if (num == 7) {
      return 7;
    } else if (num == 8) {
      return 8;
    } else {
      return 9;
    }
  }

  hexagramToNum() {
    var newHexListNum = [0, 0, 0, 0, 0, 0];
    for (int i = 0; i < 6; i++) {
      if (hexList[i] == 6 || hexList[i] == 8) {
        newHexListNum[i] = 0;
      } else {
        newHexListNum[i] = 1;
      }
    }
    return newHexListNum;
  }

//老阳变阴，老阴转阳
  void setOppoHexList() {
    // print(oppoHexList.toString() + "jgux");
    for (int i = 0; i < hexList.length; i++) {
      if (hexList[i] == 6) {
        oppoHexList[i] = 7;
        numOfChangeHex++;
      } else if (hexList[i] == 9) {
        oppoHexList[i] = 8;
        numOfChangeHex++;
      } else {
        oppoHexList[i] = hexList[i];
      }
    }
    // print(oppoHexList.toString() + "jgu");
  }

  //分析判断方法
  String methodSelection(int num) {
    if (num == 1) {
      return 'When there is 1 changed element, it is analyzed based on the words of changed element in opposite hexagram';
    } else if (num == 2) {
      return 'When there is 2 changed element, it is analyzed based on the words of upper changed element in original hexagram';
    } else if (num == 3) {
      return 'When there is 3 changed element, it is analyzed based on opposite and (major) original hexagram.';
    } else if (num == 4) {
      return 'When there is 4 changed element, it is analyzed based on the words of 2 unchanged elements';
    } else if (num == 5) {
      return 'When there is a changed element, it is analyzed based on the words of the unchanged element';
    } else if (num == 6) {
      return 'When there is a changed element, it is analyzed based on opposite hexagram';
    } else {
      return 'When there is no changed element, it is analyzed based on original hexagram';
    }
  }

  void processing() {
    var newHexList = [0, 0, 0, 0, 0, 0];
    for (int i = 0; i < 6; i++) {
      totalReminder = 0;
      int num = BEGINNING;

      for (int i = 0; i < 3; i++) {
        int newNum = getChange(num);
        num = newNum;
      }

      newHexList[i] = getHexagram((49 - totalReminder) / 4);
    }

    setState(() {
      hexList = newHexList;
      hexListNum = hexagramToNum();
      print(hexList.toString());
    });

    setOppoHexList();
    method = methodSelection(numOfChangeHex);

    isButtonValid = !isButtonValid;
    // startTimer();
    var now = DateTime.now();
    var twoHours = now.add(const Duration(hours: 1)).difference(now);
    seconds = twoHours.inSeconds;
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
      });
      if (seconds == 0) {
        //倒计时秒数为0，取消定时器
        cancelTimer();
        setState(() {
          isButtonValid = !isButtonValid;
        });
      }
    });
  }

  //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
  String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(hour) +
        ":" +
        formatTime(minute) +
        ":" +
        formatTime(second);
  }

  //数字格式化，将 0~9 的时间转换为 00~09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void cancelTimer() {
    countDownTimer.cancel();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 150, 0, 10),
            child: isButtonValid ? Hexagram(hexList) : Hexagram(hexListNum),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 10),
            child: RawMaterialButton(
              onPressed: isButtonValid
                  ? () => processing()
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Analysis(hexList, oppoHexList, method)),
                      );
                    },
              elevation: 2.0,
              fillColor: isButtonValid ? Colors.black87 : Colors.white,
              child: Icon(
                isButtonValid ? Icons.arrow_upward : Icons.arrow_downward,
                color: isButtonValid ? Colors.white : Colors.black87,
                size: 100.0,
              ),
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text(
              isButtonValid
                  ? 'Press it to get started'
                  : constructTime(seconds),
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
