import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taller/pantallas/ejemplos_listas.dart';
import 'package:taller/pantallas/formulario.dart';
import 'package:taller/pantallas/operaciones_matematicas.dart';
import 'package:taller/widgets/favoritos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo taller',
      debugShowCheckedModeBanner: false, //retira el banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimerWidget(),
    );
  }
}

class PrimerWidget extends StatelessWidget {
  const PrimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row? info() {
      return Row(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              color: Colors.pink[100],
              child: Image.network(
                'http://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Texto 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Texto 2',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.star, color: Colors.red), Text('41')],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      Text(
                        'Texto 3',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      Text(
                        'Texto 4',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.print,
                        color: Colors.blue,
                      ),
                      Text(
                        'Texto 5',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Tener a un perro implica una gran responsabilidad. '
                  'Aunque los consejos para cuidar a tu mascota son sencillos, '
                  'e debe saber que serán para el resto de su vida, por lo tanto, cuidar a tu perro, '
                  'o a ese perro que pretendes adoptar, no es tarea fácil. '
                  'Además de facilitarle las cosas básicas como son la comida, '
                  'el agua, el veterinario o hacer ejerciciohay otros consejos que son, '
                  'importantes para que tu mascota esté feliz y con una salud de hierro..',
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ))
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Taller App'),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
                child: Column(
              children: [
                Image.network(
                  'http://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                  height: 100,
                ),
                Text('perritos')
              ],
            )),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OperacionesMatematicas()));
                },
                icon: Icon(Icons.calculate),
                label: Text('Operaciones')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EjemplosListas()));
                },
                icon: Icon(Icons.list),
                label: Text('Listas')),
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, size) {
        return size.biggest.width > 600.0
            ? Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.pink[100],
                      child: Image.network(
                        'http://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Texto 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Texto 2',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Favoritos()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 3',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 4',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.print,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 5',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Tener a un perro implica una gran responsabilidad. '
                          'Aunque los consejos para cuidar a tu mascota son sencillos, '
                          'e debe saber que serán para el resto de su vida, por lo tanto, cuidar a tu perro, '
                          'o a ese perro que pretendes adoptar, no es tarea fácil. '
                          'Además de facilitarle las cosas básicas como son la comida, '
                          'el agua, el veterinario o hacer ejerciciohay otros consejos que son, '
                          'importantes para que tu mascota esté feliz y con una salud de hierro..',
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ))
                ],
              )
            : Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.pink[100],
                      child: Image.network(
                        'http://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Texto 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Texto 2',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Favoritos(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 3',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 4',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.print,
                                color: Colors.blue,
                              ),
                              Text(
                                'Texto 5',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Tener a un perro implica una gran responsabilidad. '
                          'Aunque los consejos para cuidar a tu mascota son sencillos, '
                          'e debe saber que serán para el resto de su vida, por lo tanto, cuidar a tu perro, '
                          'o a ese perro que pretendes adoptar, no es tarea fácil. '
                          'Además de facilitarle las cosas básicas como son la comida, '
                          'el agua, el veterinario o hacer ejerciciohay otros consejos que son, '
                          'importantes para que tu mascota esté feliz y con una salud de hierro..',
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ))
                ],
              );
      }),
    );
  }
}
