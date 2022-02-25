import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taller/constantes/juegos_video.dart';

class GridVista extends StatelessWidget {
  const GridVista({Key? key}) : super(key: key);

  static JuegosVideo _juegosVideo = JuegosVideo();

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: _juegosVideo.listaEjemploMap
          .map<Column>((juegosVideoMap) => Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.network(juegosVideoMap['url_imagen']!)),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                        juegosVideoMap['nombre']!,
                        style: GoogleFonts.aladin(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      )))
                ],
              ))
          .toList(),
    );
  }
}
