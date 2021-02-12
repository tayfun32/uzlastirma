import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzlastirma/screen/denemeload.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  //final AdvertService _advertService = AdvertService();

  @override
  void initState() {
    // _advertService.showBanner();
  }

  List<String> langname = [
    "Deneme Sınavı 1",
    "Deneme Sınavı 2",
    "Deneme Sınavı 3",
    "Deneme Sınavı 4",
    "Deneme Sınavı 5",
    "Deneme Sınavı 6",
    "Deneme Sınavı 7",
    "Deneme Sınavı 8",
    "Deneme Sınavı 9",
    "Deneme Sınavı 10",
    "Deneme Sınavı 11",
    "Deneme Sınavı 12",
    "Deneme Sınavı 13",
    "Deneme Sınavı 14",
    "Deneme Sınavı 15",
    "Deneme Sınavı 16",
    "Deneme Sınavı 17",
    "Deneme Sınavı 18",
    "Deneme Sınavı 19",
    "Deneme Sınavı 20",
    "Deneme Sınavı 21"
  ];
  List<String> images = [
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png",
    "images/tebligat.png"
  ];

  Widget customcard(String langname, String image) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Denemeloadjson(langname)));
          },
          /*Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => loadjson(langname)));*/
        child: Material(
          color: Colors.lightBlueAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      child: ClipOval(
                        child:
                            Image(fit: BoxFit.cover, image: AssetImage(image)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      langname,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontFamily: "Quando",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Uygulamadan Çıkmak İstediğinize Emin Misiniz ?"),
              actions: <Widget>[
                FlatButton(
                    child: Text("Hayır"),
                    onPressed: () => Navigator.of(context).pop(false)),
                FlatButton(
                  child: Text("Evet"),
                  onPressed: () => exit(0),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Uzlaştırma Sınavı Hazılık Soruları",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Quando",
              fontSize: 12,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new IconButton(
                  iconSize: 30,
                  icon: new Icon(Icons.home),
                  tooltip: "instagram sayfamız",
                  color: Colors.white,
                  onPressed: (() {
                   /* Navigator.pop(context);
                    _Linkegit('https://www.instagram.com/gorevde_yukselme/');*/
                  })),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            customcard(langname[0], images[0]),
            customcard(langname[1], images[1]),
            customcard(langname[2], images[2]),
            customcard(langname[3], images[3]),
            customcard(langname[4], images[4]),
            customcard(langname[5], images[5]),
            customcard(langname[6], images[6]),
            customcard(langname[7], images[7]),
            customcard(langname[8], images[8]),
            customcard(langname[9], images[9]),
            customcard(langname[10], images[10]),
            customcard(langname[11], images[11]),
            customcard(langname[12], images[12]),
            customcard(langname[13], images[13]),
            customcard(langname[14], images[14]),
            customcard(langname[15], images[15]),
            customcard(langname[16], images[16]),
            customcard(langname[17], images[17]),
            customcard(langname[18], images[18]),
            customcard(langname[19], images[19]),
            customcard(langname[20], images[20])
          ],
        ),
      ),
    );
  }
}

/*Future _Linkegit(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('hata oluştu');
  }*/

