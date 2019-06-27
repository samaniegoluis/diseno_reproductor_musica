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
              SizedBox(height: 20,),
              portada(),
              SizedBox(height: 20,),
              tituloCancion(),
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
      padding: EdgeInsets.only(top: 20, left: 15),
      // color: Colors.red,
      height: 100,
      child: Row(
        children: <Widget>[
          Container(
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

  Widget tituloCancion(){
    return Container(
      height: 50,
      child: Column(
        children: <Widget>[
          Text(widget.canciones[widget.index].titulo, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text(widget.canciones[widget.index].disco, style: TextStyle(color: Colors.grey,fontSize: 18,),),
        ],
      ),
    );
  }
}
