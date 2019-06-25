import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'modelos/canciones_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C1027),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              imagenFondo(context),
              customAppBar(),
              descripcionArtista(context),
            ],
          ),
          Expanded(
            child: ListView(
              children:
                  canciones.map((cancion) => itemAudio(cancion, 1)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget imagenFondo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    decoration: BoxDecoration(
      color: const Color(0xff1C1e2C),
      image: DecorationImage(
        image: AssetImage('assets/imgs/metallica.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      ),
    ),
  );
}

Widget customAppBar() {
  return Container(
    height: 80,
    padding: EdgeInsets.all(10),
    color: Colors.transparent,
    child: Row(
      children: <Widget>[
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget descripcionArtista(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height / 3,
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Best of Metallica',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '50 Songs | + 1.3 M Favorites',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print('Click');
                },
                child: Container(
                  height: 35,
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text(
                        'PLAY ALL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    print('Click download');
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.orange,
                        ),
                        Text(
                          'DOWNLOAD',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.orange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget itemAudio(Cancion cancion, int index) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 50,
    child: Row(
      children: <Widget>[
        Text(
          index.toString().padLeft(2, "0"),
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 40,
          width: 40,
          child: Image.asset(
            cancion.imagen,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(cancion.titulo,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            Text(cancion.disco, style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_horiz, color: Colors.grey),
      ],
    ),
  );
}
