class Cancion {
  final String titulo;
  final String disco;
  final String imagen;
  final String imagenDisco;

  Cancion({this.titulo, this.disco, this.imagen, this.imagenDisco});
}

List<Cancion> canciones = [
  Cancion(
    titulo: "Cancion uno",
    disco: "Disco 1",
    imagen: "assets/imgs/metallica.jpg",
    imagenDisco: "assets/imgs/disco.jpg",
  ),
  Cancion(
    titulo: "Cancion dos",
    disco: "Disco 2",
    imagen: "assets/imgs/metallica.jpg",
    imagenDisco: "assets/imgs/disco2.jpg",
  ),
  Cancion(
    titulo: "Cancion tres",
    disco: "Disco 3",
    imagen: "assets/imgs/metallica.jpg",
    imagenDisco: "assets/imgs/disco3.jpg",
  ),
  Cancion(
    titulo: "Cancion cuatro",
    disco: "Disco 4",
    imagen: "assets/imgs/metallica.jpg",
    imagenDisco: "assets/imgs/disco4.jpg",
  ),
  Cancion(
    titulo: "Cancion cinco",
    disco: "Disco 5",
    imagen: "assets/imgs/metallica.jpg",
    imagenDisco: "assets/imgs/disco5.jpg",
  ),
];
