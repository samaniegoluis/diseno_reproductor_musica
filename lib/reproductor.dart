import 'dart:ui';
import 'package:flutter/material.dart';

import 'modelos/canciones_model.dart';

class ReproductorPage extends StatefulWidget {
  final List<Cancion> canciones;
  final int index;

  ReproductorPage({Key key, this.canciones, this.index}) : super(key: key);

  _ReproductorPageState createState() => _ReproductorPageState();
}

class _ReproductorPageState extends State<ReproductorPage> {
  double _valorBarra = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          imagenFondo(),
          filtro(),
          Column(
            children: <Widget>[
              customAppBar(),
              SizedBox(
                height: 20,
              ),
              portada(),
              SizedBox(
                height: 20,
              ),
              tituloCancion(),
              porgressBar(),
              SizedBox(
                height: 5,
              ),
              botones(),
              Spacer(),
              botonesOpciones(),
            ],
          ),
        ],
      ),
    );
  }

  Widget imagenFondo() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1c1e2c),
        image: DecorationImage(
          image: AssetImage('assets/imgs/disco.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstATop),
        ),
      ),
    );
  }

  Widget filtro() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0),
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15),
      // color: Colors.red,
      height: 100,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Best of Metallica',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        '50 Songs | + 1.5 M Favorites',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget portada() {
    return Container(
      height: 300,
      width: 300,
      child: Image.asset(
        'assets/imgs/disco.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget tituloCancion() {
    return Container(
      height: 50,
      child: Column(
        children: <Widget>[
          Text(
            widget.canciones[widget.index].titulo,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.canciones[widget.index].disco,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget porgressBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Slider(
            value: _valorBarra,
            onChanged: onChanged,
            activeColor: Colors.orange,
            inactiveColor: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '00:05',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  '-00:05',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onChanged(double value) {
    setState(() {
      _valorBarra = value;
    });
  }

  Widget botones() {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.fast_rewind,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.fast_forward,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget botonesOpciones() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.bookmark_border,
            color: Colors.orange,
          ),
          Icon(
            Icons.shuffle,
            color: Colors.orange,
          ),
          Icon(
            Icons.repeat,
            color: Colors.orange,
          ),
          Icon(
            Icons.playlist_add,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
