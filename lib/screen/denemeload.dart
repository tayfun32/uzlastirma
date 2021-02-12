import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:uzlastirma/home.dart';
import 'package:uzlastirma/result.dart';

class Denemeloadjson extends StatelessWidget {
  String langname;
  Denemeloadjson(this.langname);
  String assettoload;

  setasset() {
    if (langname == "Deneme Sınavı 1") {
      assettoload = "assets/denemesinavi1.json";
    } else if (langname == "Deneme Sınavı 2") {
      assettoload = "assets/denemesinavi2.json";
    }else if (langname == "Deneme Sınavı 3") {
      assettoload = "assets/denemesinavi3.json";
    }else if (langname == "Deneme Sınavı 4") {
      assettoload = "assets/denemesinavi4.json";
    }else if (langname == "Deneme Sınavı 5") {
      assettoload = "assets/denemesinavi5.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();

    return Scaffold(
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return Center(
              child: Text(
                "Yükleniyor",
              ),
            );
          } else {
            return quizpage(mydata: mydata);
          }
        },
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  final mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata: mydata);
}

class _quizpageState extends State<quizpage> {

/*  final AdvertService _advertService = AdvertService();*/
  ConfettiController myController;
  /*void initState(){
    _advertService.showBanner();
    _advertService.showIntersitial();
  }*/
  List mydata;
  int i = 1;
  int j = 1;
  int marks = 0;
  Color colortoshow = Colors.cyan;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int timer = 60;
  bool canceltimer = false;
  String showtimer = "60";
  String cevap = "";
  var random_array;
  Map<String, Color> btncolor = {
    "a": Colors.cyan,
    "b": Colors.cyan,
    "c": Colors.cyan,
    "d": Colors.cyan,
    "e":Colors.cyan,
  };


  void nextquestion() {
    canceltimer = false;
    cevap = "";

    setState(() {
      if (j<20) {
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.cyan;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.cyan;
      btncolor["d"] = Colors.cyan;
      btncolor["e"] = Colors.cyan;
    });
    //starttimer();
  }
  void backquestion() {
    canceltimer = false;
    cevap = "";

    setState(() {
      if (1<j && j<20) {
        j--;
      } else {

      }
      btncolor["a"] = Colors.cyan;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.cyan;
      btncolor["d"] = Colors.cyan;
      btncolor["e"] = Colors.cyan;
    });

  }

  void initState() {
  /*  _advertService.showBanner();
      _advertService.showIntersitial();*/
    myController = ConfettiController(duration: Duration(seconds: 1));
    super.initState();
  }

  void checkanswer(String k) {
    if (mydata[2][j.toString()] == mydata[1][j.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
      myController.play();
    } else {
      colortoshow = wrong;
      cevap = mydata[2][j.toString()];
    }

    setState(() {
      canceltimer = true;
      btncolor[k] = colortoshow;
    });
  }

  _quizpageState({this.mydata});

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][j.toString()][k],
          style: TextStyle(
            color: Colors.white,
            //fontFamily: "Alike",
            fontSize: 12.0,
          ),
          maxLines: 5,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Denemeler",
            ),
            content: Text("Deneme Ekranına Dönüş İşlemi Gerçekleştiriliyor."),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>homepage(),));
                },
                child: Text(
                  'Tamam',
                ),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ConfettiWidget(
                  confettiController: myController,
                  emissionFrequency: 0.05,
                  numberOfParticles: 10,
                  blastDirection: 0,
                  maxBlastForce: 10,
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][j.toString()],
                  style: TextStyle(
                    fontSize: 11.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                    choicebutton('e'),
                    Container(
                      padding: new EdgeInsets.all(8.0),
                      child: Text(
                        "$cevap",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            backgroundColor: Colors.redAccent,
                            fontFamily: "Quando"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
           Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("Önceki"),
                      onPressed: () {
                       backquestion();
                      },
                    ),
                    SizedBox(width: 50,),
                    RaisedButton(
                      child: Text("Sonraki"),
                      onPressed: () {
                        nextquestion();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

