import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  int shop = 0;

  void counter() {
    //cambia el estado del widget
    setState(() {
      shop++; //aumentando de uno en uno
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: TextButton.icon(
          onPressed: counter,
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          label: Text(
            '$shop',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
