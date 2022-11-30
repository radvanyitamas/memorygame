import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'data/data.dart';
import 'model/TileModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splendex Memory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TileModel> gridViewTiles = <TileModel>[];
  List<TileModel> questionPairs = <TileModel>[];
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    setState(() {
      if (kDebugMode) {
        print("2 seconds done");
      }
      questionPairs = getQuestionPairs();
      gridViewTiles = questionPairs;
      selected = false;
      isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: createAppBarActions()),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: !isStarted
            ? Center(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            points = 0;
                            reStart();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Text(
                            "START NEW GAME",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    points != questionPairs.length / 2
                        ? GridView(
                            shrinkWrap: true,
                            //physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 0.0,
                                    maxCrossAxisExtent: 100.0),
                            children:
                                List.generate(gridViewTiles.length, (index) {
                              return Tile(
                                imagePathUrl:
                                    gridViewTiles[index].getImageAssetPath(),
                                tileIndex: index,
                                parent: this,
                              );
                            }),
                          )
                        : Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    points = 0;
                                    reStart();
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    "Restart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
      ),
    );
  }

  List<Widget> createAppBarActions() {
    // use your app state here to create the actions you need
    // use if / else or switch / case for the states
    return [
      Container(
          child: Row(
        children: [
          points != questionPairs.length / 2
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Current tries: ",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "$points",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : Container(),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    points = 0;
                    reStart();
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    "Restart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )
        ],
      ))
    ];
  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _HomeState parent;

  Tile(
      {required this.imagePathUrl,
      required this.tileIndex,
      required this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              if (kDebugMode) {
                print("add point");
              }
              points = points + 1;
              if (kDebugMode) {
                print(selectedTile + " thishis" + widget.imagePathUrl);
              }

              TileModel tileModel = TileModel();
              if (kDebugMode) {
                print(widget.tileIndex);
              }
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                if (kDebugMode) {
                  print(selectedIndex);
                }
                myPairs[selectedIndex] = tileModel;
                widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              if (kDebugMode) {
                print(
                    "$selectedTile thishis ${myPairs[widget.tileIndex].getImageAssetPath()}");
                print("wrong choice");
                print(widget.tileIndex);
                print(selectedIndex);
              }
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            if (kDebugMode) {
              print(selectedTile);
              print(selectedIndex);
            }
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
                ? myPairs[widget.tileIndex].getImageAssetPath()
                : widget.imagePathUrl)
            : Container(
                color: Colors.white,
                child: Image.asset("assets/cards/correct.png"),
              ),
      ),
    );
  }
}
